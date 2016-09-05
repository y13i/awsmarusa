desc "Check Route 53 Domains resources"
task :route53domains do
  check_service(Aws::Route53Domains::Client, true,
    "Domains" => {
      method_name: :list_domains,
      arrayish:    [:domains],
      threshold:   1,
      next:        [:next_page_marker],
    },
  )
end
