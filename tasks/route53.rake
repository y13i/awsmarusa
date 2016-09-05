desc "Check Route 53 resources"
task :route53 do
  check_service(Aws::Route53::Client, true,
    "Hosted Zones" => {
      method_name: :list_hosted_zones,
      arrayish:    [:hosted_zones],
      threshold:   1,
      next:        [:marker],
    },
  )
end
