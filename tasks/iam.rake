desc "Check IAM resources"
task :iam do
  check_service(Aws::IAM::Client, true,
    "Account Aliases" => {
      method_name: :list_account_aliases,
      arrayish:    [:account_aliases],
      threshold:   1,
      next:        [:marker],
    },

    "Groups" => {
      method_name: :list_groups,
      arrayish:    [:groups],
      threshold:   1,
      next:        [:marker],
    },

    "MFA Devices" => {
      method_name: :list_mfa_devices,
      arrayish:    [:mfa_devices],
      threshold:   1,
      next:        [:marker],
    },

    "OpenID Connect Providers" => {
      method_name: :list_open_id_connect_providers,
      arrayish:    [:open_id_connect_provider_list],
      threshold:   1,
    },

    "Policies" => {
      method_name:   :list_policies,
      method_params: {scope: "Local"},
      arrayish:      [:policies],
      threshold:     1,
      next:          [:marker],
    },

    "Roles" => {
      method_name: :list_roles,
      arrayish:    [:roles],
      threshold:   1,
      next:        [:marker],
    },

    "SAML Providers" => {
      method_name: :list_saml_providers,
      arrayish:    [:saml_provider_list],
      threshold:   1,
    },

    "Server Certificates" => {
      method_name: :list_server_certificates,
      arrayish:    [:server_certificate_metadata_list],
      threshold:   1,
      next:        [:marker],
    },

    "Signing Certificates" => {
      method_name: :list_signing_certificates,
      arrayish:    [:certificates],
      threshold:   1,
      next:        [:marker],
    },

    "SSH Public Keys" => {
      method_name: :list_ssh_public_keys,
      arrayish:    [:ssh_public_keys],
      threshold:   1,
      next:        [:marker],
    },

    "Users" => {
      method_name: :list_users,
      arrayish:    [:users],
      threshold:   1,
      next:        [:marker],
    },

    "Virtual MFA Devices" => {
      method_name: :list_virtual_mfa_devices,
      arrayish:    [:virtual_mfa_devices],
      threshold:   1,
      next:        [:marker],
    },
  )
end
