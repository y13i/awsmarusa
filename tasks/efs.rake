desc "Check EFS resources"
task :efs do
  check_service(Aws::EFS::Client, false,
    "EFS file system" => {
      method_name: :describe_file_systems,
      arrayish:    [:file_systems],
      threshold:   1,
      next:        [:next_marker],
    },
  )
end
