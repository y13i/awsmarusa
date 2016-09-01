require "aws-sdk"
require "colorize"

def iterate_regions(is_global = false, &block)
  @regions ||= Aws::EC2::Client.new.describe_regions.regions.map(&:region_name)

  threads = (is_global ? ["us-east-1"] : @regions).map do |r|
    Thread.new r do |region|
      begin
        block.call region
      rescue Aws::Errors::NoSuchEndpointError
        puts "  May not be supported on #{region}".light_black
      end
    end
  end

  threads.each(&:join)
end

def check_resources(name: "resource", arrayish: [], threshold: 1, is_above: false, filter: nil)
  count = if filter
    arrayish.select(&filter).size
  else
    arrayish.count
  end

  list = ENV["VERBOSE"] ? arrayish.inspect : nil

  count_string = if count >= threshold
    "#{count}#{"+" if is_above && !is_above.empty?}".red
  else
    count.to_s.green
  end

  puts "  #{name}: #{count_string}#{list ? " (#{list})" : nil}"
end

def check_service(client_class = NilClass, is_global = false, resource_types = {})
  iterate_regions(is_global) do |region|
    client = client_class.new region: region

    resource_types.each do |name, properties|
      abort if properties[:method_name].to_s.match(/\A(delete|put|update|remove)/)

      response = client.send properties[:method_name], (properties[:method_params] ? properties[:method_params] : {})

      check_resources(
        name:      "#{name} #{"(#{region})".light_black}",
        arrayish:  properties[:arrayish].inject(response) {|a, m| a.send(m)},
        threshold: properties[:threshold],
        is_above:  (properties[:next] ? properties[:next].inject(response) {|a, m| a.send(m)} : false),
        filter:    properties[:filter],
      )
    end
  end
end
