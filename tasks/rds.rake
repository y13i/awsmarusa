desc "Check RDS resources"
task :rds do
  check_service(Aws::RDS::Client, false,
    "DB Cluster Parameter Groups" => {
      method_name: :describe_db_cluster_parameter_groups,
      arrayish:    [:db_cluster_parameter_groups],
      threshold:   1,
      next:        [:marker],
    },

    "DB Cluster Snapshots" => {
      method_name: :describe_db_cluster_snapshots,
      arrayish:    [:db_cluster_snapshots],
      threshold:   1,
      next:        [:marker],
    },

    "DB Clusters" => {
      method_name: :describe_db_clusters,
      arrayish:    [:db_clusters],
      threshold:   1,
      next:        [:marker],
    },

    "DB Instances" => {
      method_name: :describe_db_instances,
      arrayish:    [:db_instances],
      threshold:   1,
      next:        [:marker],
    },

    "DB Parameter Groups" => {
      method_name: :describe_db_parameter_groups,
      arrayish:    [:db_parameter_groups],
      threshold:   1,
      next:        [:marker],
    },

    "DB Security Groups" => {
      method_name: :describe_db_security_groups,
      arrayish:    [:db_security_groups],
      threshold:   2,
      next:        [:marker],
    },

    "DB Snapshots" => {
      method_name: :describe_db_snapshots,
      arrayish:    [:db_snapshots],
      threshold:   1,
      next:        [:marker],
    },

    "DB Subnet Groups" => {
      method_name: :describe_db_subnet_groups,
      arrayish:    [:db_subnet_groups],
      threshold:   1,
      next:        [:marker],
    },

    "DB Option Groups" => {
      method_name: :describe_option_groups,
      arrayish:    [:option_groups_list],
      threshold:   1,
      next:        [:marker],
    },

    "Reserverd DB Instances" => {
      method_name: :describe_reserved_db_instances,
      arrayish:    [:reserved_db_instances],
      threshold:   1,
      next:        [:marker],
    },
  )
end
