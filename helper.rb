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

def check_resource(resource_name = "resource", arrayish = [], threshold = 1, is_above = false)
  count = arrayish.to_a.size

  list = ENV["VERBOSE"] ? arrayish.inspect : nil

  count_string = if count >= threshold
    "#{count}#{"+" if is_above && !is_above.empty?}".red
  else
    count.to_s.green
  end

  puts "  #{resource_name}: #{count_string}#{list ? " (#{list})" : nil}"
end

def check_service(client_class = NilClass, is_global = false, resources = {})
  iterate_regions(is_global) do |region|
    client = client_class.new region: region

    resources.each do |resource_name, properties|
      abort if properties[:method_name].to_s.match(/\A(delete|put|update|remove)/)

      response = client.send properties[:method_name], (properties[:method_params] ? properties[:method_params] : {})

      check_resource(
        "#{resource_name} #{"(#{region})".light_black}",
        properties[:arrayish].inject(response) {|a, m| a.send(m)},
        properties[:threshold],
        (properties[:next] ? properties[:next].inject(response) {|a, m| a.send(m)} : false)
      )
    end
  end
end
