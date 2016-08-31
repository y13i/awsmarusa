namespace :check do
  desc "Check CodeCommit resources"
  task :codecommit do
    check_service(Aws::CodeCommit::Client, false,
      "Repositories" => {
        method_name: :list_repositories,
        arrayish:    [:repositories],
        threshold:   1,
        next:        [:next_token],
      },
    )
  end
end
