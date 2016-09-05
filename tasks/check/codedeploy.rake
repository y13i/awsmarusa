namespace :check do
  desc "Check CodeDeploy resources"
  task :codedeploy do
    check_service(Aws::CodeDeploy::Client, false,
      "Applications" => {
        method_name: :list_applications,
        arrayish:    [:applications],
        threshold:   1,
        next:        [:next_token],
      },

      "Deployment Configurations" => {
        method_name: :list_deployment_configs,
        arrayish:    [:deployment_configs_list],
        threshold:   4,
        next:        [:next_token],
      },

      "On-premise Instances" => {
        method_name: :list_on_premises_instances,
        arrayish:    [:instance_names],
        threshold:   1,
        next:        [:next_token],
      },
    )
  end
end
