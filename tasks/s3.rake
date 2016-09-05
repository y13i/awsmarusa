desc "Check S3 resources"
task :s3 do
  check_service(Aws::S3::Client, true,
    "Buckets" => {
      method_name: :list_buckets,
      arrayish:    [:buckets],
      threshold:   1,
    },
  )
end
