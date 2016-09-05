desc "Check SQS resources"
task :sqs do
  check_service(Aws::SQS::Client, false,
    "Queues" => {
      method_name: :list_queues,
      arrayish:    [:queue_urls],
      threshold:   1,
    },
  )
end
