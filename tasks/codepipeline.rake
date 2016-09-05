desc "Check CodePipeline resources"
task :codepipeline do
  check_service(Aws::CodePipeline::Client, false,
    "Action Types" => {
      method_name:   :list_action_types,
      method_params: {action_owner_filter: "Custom"},
      arrayish:      [:action_types],
      threshold:     1,
      next:          [:next_token],
    },

    "Pipelines" => {
      method_name: :list_pipelines,
      arrayish:    [:pipelines],
      threshold:   1,
      next:        [:next_token],
    },
  )
end
