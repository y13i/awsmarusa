desc "Check OpsWorks resources"
task :opsworks do
  check_service(Aws::OpsWorks::Client, false,
    "Stacks" => {
      method_name: :describe_stacks,
      arrayish:    [:stacks],
      threshold:   1,
    },
  )
end
