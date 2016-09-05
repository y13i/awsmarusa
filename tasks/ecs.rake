desc "Check ECS resources"
task :ecs do
  check_service(Aws::ECS::Client, false,
    "Clusters" => {
      method_name: :list_clusters,
      arrayish:    [:cluster_arns],
      threshold:   1,
      next:        [:next_token],
    },

    "Services" => {
      method_name: :list_services,
      arrayish:    [:service_arns],
      threshold:   1,
      next:        [:next_token],
    },
  )
end
