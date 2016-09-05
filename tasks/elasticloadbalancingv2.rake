desc "Check ElasticLoadBalancingV2 resources"
task :elasticloadbalancingv2 do
  check_service(Aws::ElasticLoadBalancingV2::Client, false,
    "Load Balancers" => {
      method_name: :describe_load_balancers,
      arrayish:    [:load_balancers],
      threshold:   1,
      next:        [:next_marker],
    },

    "Target Groups" => {
      method_name: :describe_target_groups,
      arrayish:    [:target_groups],
      threshold:   1,
      next:        [:next_marker],
    },
  )
end
