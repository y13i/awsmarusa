namespace :check do
  desc "Check EC2 resources"
  task :ec2 do
    check_service(Aws::EC2::Client, false,
      "EIPs" => {
        method_name: :describe_addresses,
        arrayish:    [:addresses],
        threshold:   1,
      },

      "Linked EC2-Classic Instances" => {
        method_name: :describe_classic_link_instances,
        arrayish:    [:instances],
        threshold:   1,
      },

      "Customer Gateways" => {
        method_name: :describe_customer_gateways,
        arrayish:    [:customer_gateways],
        threshold:   1,
      },

      "Flow Logs" => {
        method_name: :describe_flow_logs,
        arrayish:    [:flow_logs],
        threshold:   1,
      },

      "Dedicated Hosts" => {
        method_name: :describe_hosts,
        arrayish:    [:hosts],
        threshold:   1,
      },

      "Images" => {
        method_name:   :describe_images,
        method_params: {owners: ["self"]},
        arrayish:      [:images],
        threshold:     1,
      },

      "Instances" => {
        method_name: :describe_instances,
        arrayish:    -> (response) {response.reservations.map {|r| r.instances}.flatten},
        threshold:   1,
        next:        [:next_token],
      },

      "Internet Gateways" => {
        method_name: :describe_internet_gateways,
        arrayish:    [:internet_gateways],
        threshold:   2,
      },


      "Key Pairs" => {
        method_name: :describe_key_pairs,
        arrayish:    [:key_pairs],
        threshold:   1,
      },

      "NAT Gateways" => {
        method_name: :describe_nat_gateways,
        arrayish:    [:nat_gateways],
        threshold:   1,
        # next:        :next_token,
      },

      "Network ACLs" => {
        method_name: :describe_network_acls,
        arrayish:    [:network_acls],
        threshold:   2,
      },

      "Network Interfaces" => {
        method_name: :describe_network_interfaces,
        arrayish:    [:network_interfaces],
        threshold:   1,
      },

      "Placement Groups" => {
        method_name: :describe_placement_groups,
        arrayish:    [:placement_groups],
        threshold:   1,
      },

      "Reserved Instances" => {
        method_name: :describe_reserved_instances,
        arrayish:    [:reserved_instances],
        threshold:   1,
      },

      "Route Tables" => {
        method_name: :describe_route_tables,
        arrayish:    [:route_tables],
        threshold:   2,
      },

      # "Scheduled Instances" => {
      #   method_name: :describe_scheduled_instances,
      #   arrayish:    [:scheduled_instance_set],
      #   threshold:   1,
      #   next:        :next_token,
      # },

      "Security Groups" => {
        method_name: :describe_security_groups,
        arrayish:    [:security_groups],
        threshold:   2,
      },

      "EBS Snapshots" => {
        method_name:   :describe_snapshots,
        method_params: {owner_ids: ["self"]},
        arrayish:      [:snapshots],
        threshold:     1,
        # next:          :next_token,
      },

      "Subnet" => {
        method_name: :describe_subnets,
        arrayish:    [:subnets],
        threshold:   5,
      },

      "EBS Volumes" => {
        method_name: :describe_volumes,
        arrayish:    [:volumes],
        threshold:   1,
        # next:        :next_token,
      },

      "VPC Endpoints" => {
        method_name: :describe_vpc_endpoints,
        arrayish:    [:vpc_endpoints],
        threshold:   1,
        # next:        :next_token,
      },

      "VPC Peering Connections" => {
        method_name: :describe_vpc_peering_connections,
        arrayish:    [:vpc_peering_connections],
        threshold:   1,
      },

      "VPCs" => {
        method_name: :describe_vpcs,
        arrayish:    [:vpcs],
        threshold:   2,
      },

      "VPN Connections" => {
        method_name: :describe_vpn_connections,
        arrayish:    [:vpn_connections],
        threshold:   1,
      },

      "VPN Gateways" => {
        method_name: :describe_vpn_gateways,
        arrayish:    [:vpn_gateways],
        threshold:   1,
      },
    )
  end
end
