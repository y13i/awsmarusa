namespace :check do
  desc "Check ACM resources"
  task :acm do
    check_service(Aws::ACM::Client, false,
      "ACM Certificates" => {
        method_name:     :list_certificates,
        arrayish:        [:certificate_summary_list],
        threshold:       1,
        next:            [:next_token],
      },
    )
  end
end
