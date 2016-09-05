desc "Check ElasticsearchService resources"
task :elasticsearchservice do
  check_service(Aws::ElasticsearchService::Client, false,
    "Elasticsearch Domains" => {
      method_name: :list_domain_names,
      arrayish:    [:domain_names],
      threshold:   1,
    },
  )
end
