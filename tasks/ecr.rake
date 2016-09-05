desc "Check ECR resources"
task :ecr do
  check_service(Aws::ECR::Client, false,
    "Repositories" => {
      method_name: :describe_repositories,
      arrayish:    [:repositories],
      threshold:   1,
      next:        [:next_token],
    },
  )
end
