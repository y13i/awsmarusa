desc "Check ElasticLoadBalancing resources"
task :elasticloadbalancing do
  check_service(Aws::ElasticLoadBalancing::Client, false,
    "Load Balancers" => {
      method_name: :describe_load_balancers,
      arrayish:    [:load_balancer_descriptions],
      threshold:   1,
      next:        [:next_marker],
    },
  )
end
