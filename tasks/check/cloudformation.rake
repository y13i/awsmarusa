namespace :check do
  desc "Check CloudFormation resources"
  task :cloudformation do
    check_service(Aws::CloudFormation::Client, false,
      "Stacks" => {
        method_name: :describe_stacks,
        arrayish:    [:stacks],
        threshold:   1,
        next:        [:next_token],
      },
    )
  end
end
