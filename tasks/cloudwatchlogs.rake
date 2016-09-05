desc "Check CloudWatchLogs resources"
task :cloudwatchlogs do
  check_service(Aws::CloudWatchLogs::Client, false,
    "Log Groups" => {
      method_name: :describe_log_groups,
      arrayish:    [:log_groups],
      threshold:   1,
      next:        [:next_token],
    },
  )
end
