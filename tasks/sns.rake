desc "Check SNS resources"
task :sns do
  check_service(Aws::SNS::Client, false,
    "Phone Numbers" => {
      method_name: :list_phone_numbers_opted_out,
      arrayish:    [:phone_numbers],
      threshold:   1,
      next:        [:next_token],
    },

    "Platform Applications" => {
      method_name: :list_platform_applications,
      arrayish:    [:platform_applications],
      threshold:   1,
      next:        [:next_token],
    },

    "Subscriptions" => {
      method_name: :list_subscriptions,
      arrayish:    [:subscriptions],
      threshold:   1,
      next:        [:next_token],
    },

    "Topics" => {
      method_name: :list_topics,
      arrayish:    [:topics],
      threshold:   1,
      next:        [:next_token],
    },
  )
end
