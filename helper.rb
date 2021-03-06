require "aws-sdk"
require "colorize"

def iterate_regions(is_global = false, &block)
  @regions ||= if ENV["REGIONS"]
    ENV["REGIONS"].split(",")
  else
    Aws::EC2::Client.new.describe_regions.regions.map(&:region_name)
  end

  threads = (is_global ? ["us-east-1"] : @regions).map do |r|
    Thread.new r do |region|
      Thread.current[:output] = block.call region
    end
  end

  threads.map do |thread|
    thread.join
    thread[:output]
  end
end

def check_resources(arrayish: [], threshold: 1, is_above: false, filter: nil)
  count = if filter
    arrayish.select(&filter).size
  else
    arrayish.count
  end

  is_exceeding = count >= threshold

  count_string = if is_exceeding
    "#{count}#{"+" if is_above && !is_above.empty?}".red
  else
    count.to_s.green
  end

  {
    count_string: count_string,
    is_exceeding: is_exceeding,
  }
end

def check_service(client_class = NilClass, is_global = false, resource_types = {})
  puts client_class.name.split("::")[1]

  out = iterate_regions(is_global) do |region|
    client  = client_class.new region: region
    outputs = []

    resource_types.each do |name, properties|
      abort if properties[:method_name].to_s.match(/\A(delete|put|update|remove)/)

      output = "  #{name} #{"(#{is_global ? "global" : region})".light_black}: "

      begin
        response = client.send properties[:method_name], (properties[:method_params] ? properties[:method_params] : {})

        arrayish = if properties[:arrayish].is_a? Proc
          properties[:arrayish].call response
        else
          properties[:arrayish].inject(response) {|a, m| a.send(m)}
        end

        check_resources_result = check_resources(
          arrayish:  arrayish,
          threshold: properties[:threshold],
          is_above:  (properties[:next] ? properties[:next].inject(response) {|a, m| a.send(m)} : false),
          filter:    properties[:filter],
        )

        count_string = check_resources_result[:count_string]

        output.concat count_string
      rescue Aws::Errors::NoSuchEndpointError
        output.concat "May not be supported".cyan
      rescue => ex
        output.concat "#{ex.class}".yellow
      ensure
        if check_resources_result && check_resources_result[:is_exceeding]
          outputs.push output
        else
          outputs.push output if ENV["VERBOSE"]
        end
      end
    end

    outputs
  end

  puts out
end
