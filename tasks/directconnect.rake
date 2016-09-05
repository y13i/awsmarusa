desc "Check DirectConnect resources"
task :directconnect do
  check_service(Aws::DirectConnect::Client, false,
    "Connections" => {
      method_name: :describe_connections,
      arrayish:    [:connections],
      threshold:   1,
    },

    # "Interconnects" => {
    #   method_name: :describe_interconnects,
    #   arrayish:    [:interconnects],
    #   threshold:   1,
    # },

    "Virtual Gateways" => {
      method_name: :describe_virtual_gateways,
      arrayish:    [:virtual_gateways],
      threshold:   1,
    },

    "Virtual Interfaces" => {
      method_name: :describe_virtual_interfaces,
      arrayish:    [:virtual_interfaces],
      threshold:   1,
    },
  )
end
