desc "Check SES resources"
task :ses do
  check_service(Aws::SES::Client, false,
    "Identities" => {
      method_name: :list_identities,
      arrayish:    [:identities],
      threshold:   1,
      next:        [:next_token],
    },

    "Receipt Filters" => {
      method_name: :list_receipt_filters,
      arrayish:    [:filters],
      threshold:   1,
    },

    "Receipt Rule Sets" => {
      method_name: :list_receipt_rule_sets,
      arrayish:    [:rule_sets],
      threshold:   1,
      next:        [:next_token],
    },

    "Verified Email Addresses" => {
      method_name: :list_verified_email_addresses,
      arrayish:    [:verified_email_addresses],
      threshold:   1,
    },
  )
end
