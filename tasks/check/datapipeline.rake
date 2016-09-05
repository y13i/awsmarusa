namespace :check do
  desc "Check DataPipeline resources"
  task :datapipeline do
    check_service(Aws::DataPipeline::Client, false,
      "Pipelines" => {
        method_name: :list_pipelines,
        arrayish:    [:pipeline_id_list],
        threshold:   1,
        next:        [:marker],
      },
    )
  end
end
