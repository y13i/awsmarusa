desc "Check Lambda resources"
task :lambda do
  check_service(Aws::Lambda::Client, false,
    "Functions" => {
      method_name: :list_functions,
      arrayish:    [:functions],
      threshold:   1,
      next:        [:next_marker],
    },
  )
end
