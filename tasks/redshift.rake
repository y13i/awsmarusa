desc "Check Redshift resources"
task :redshift do
  check_service(Aws::Redshift::Client, false,
    "Cluster Parameter Groups" => {
      method_name: :describe_cluster_parameter_groups,
      arrayish:    [:parameter_groups],
      threshold:   1,
      next:        [:marker],
    },

    "Cluster Security Groups" => {
      method_name: :describe_cluster_security_groups,
      arrayish:    [:cluster_security_groups],
      threshold:   2,
      next:        [:marker],
    },

    "Cluster Snapshots" => {
      method_name: :describe_cluster_snapshots,
      arrayish:    [:snapshots],
      threshold:   1,
      next:        [:marker],
    },

    "Cluster Subnet Groups" => {
      method_name: :describe_cluster_subnet_groups,
      arrayish:    [:cluster_subnet_groups],
      threshold:   1,
      next:        [:marker],
    },

    "Clusters" => {
      method_name: :describe_clusters,
      arrayish:    [:clusters],
      threshold:   1,
      next:        [:marker],
    },

    "HSM Client Certificates" => {
      method_name: :describe_hsm_client_certificates,
      arrayish:    [:hsm_client_certificates],
      threshold:   1,
      next:        [:marker],
    },

    "Reserved Nodes" => {
      method_name: :describe_reserved_nodes,
      arrayish:    [:reserved_nodes],
      threshold:   1,
      next:        [:marker],
    },
  )
end
