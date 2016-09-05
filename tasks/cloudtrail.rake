desc "Check CloudTrail resources"
task :cloudtrail do
  check_service(Aws::CloudTrail::Client, false,
    "Trails" => {
      method_name: :describe_trails,
      arrayish:    [:trail_list],
      threshold:   1,
    },
  )
end
