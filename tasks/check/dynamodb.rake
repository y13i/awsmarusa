namespace :check do
  desc "Check DynamoDB resources"
  task :dynamodb do
    check_service(Aws::DynamoDB::Client, false,
      "Tables" => {
        method_name: :list_tables,
        arrayish:    [:table_names],
        threshold:   1,
        next:        [:last_evaluated_table_name],
      },
    )
  end
end
