desc "Check API Gateway resources"
task :api_gateway do
  check_service(Aws::APIGateway::Client, false,
    "REST API" => {
      method_name: :get_rest_apis,
      arrayish:    [:items],
      threshold:   1,
    },

    "Domain Names" => {
      method_name: :get_domain_names,
      arrayish:    [:items],
      threshold:   1,
    },

    "Client Certificates" => {
      method_name: :get_client_certificates,
      arrayish:    [:items],
      threshold:   1,
    },

    "API Keys" => {
      method_name: :get_api_keys,
      arrayish:    [:items],
      threshold:   1,
    },
  )
end
