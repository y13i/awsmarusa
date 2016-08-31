namespace :check do
  desc "Check CloudFront resources"
  task :cloudfront do
    check_service(Aws::CloudFront::Client, true,
      "Origin Access Identities" => {
        method_name: :list_cloud_front_origin_access_identities,
        arrayish:    [:cloud_front_origin_access_identity_list, :items],
        threshold:   1,
        next:        [:cloud_front_origin_access_identity_list, :marker],
      },

      "Distributions" => {
        method_name: :list_distributions,
        arrayish:    [:distribution_list, :items],
        threshold:   1,
        next:        [:distribution_list, :marker],
      },

      "Streaming Distributions" => {
        method_name: :list_streaming_distributions,
        arrayish:    [:streaming_distribution_list, :items],
        threshold:   1,
        next:        [:streaming_distribution_list, :marker],
      },
    )
  end
end
