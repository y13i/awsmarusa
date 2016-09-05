desc "Check ElastiCache resources"
task :elasticache do
  check_service(Aws::ElastiCache::Client, false,
    "Cache Clusters" => {
      method_name: :describe_cache_clusters,
      arrayish:    [:cache_clusters],
      threshold:   1,
      next:        [:marker],
    },

    "Cache Parameter Groups" => {
      method_name: :describe_cache_parameter_groups,
      arrayish:    [:cache_parameter_groups],
      threshold:   4,
      next:        [:marker],
    },

    "Cache Security Groups" => {
      method_name: :describe_cache_security_groups,
      arrayish:    [:cache_security_groups],
      threshold:   2,
      next:        [:marker],
    },

    "Cache Subnet Groups" => {
      method_name: :describe_cache_subnet_groups,
      arrayish:    [:cache_subnet_groups],
      threshold:   1,
      next:        [:marker],
    },

    "Replication Groups" => {
      method_name: :describe_replication_groups,
      arrayish:    [:replication_groups],
      threshold:   1,
      next:        [:marker],
    },

    "Reserved Cache Nodes" => {
      method_name: :describe_reserved_cache_nodes,
      arrayish:    [:reserved_cache_nodes],
      threshold:   1,
      next:        [:marker],
    },

    "Snapshots" => {
      method_name: :describe_snapshots,
      arrayish:    [:snapshots],
      threshold:   1,
      next:        [:marker],
    },
  )
end
