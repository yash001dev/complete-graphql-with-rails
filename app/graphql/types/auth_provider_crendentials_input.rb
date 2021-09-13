module Types
  class AuthProviderCredentialsInput < BaseInputObject
    graphql_name "AUTH_PROVIDER_CREDENTAILS"

    argument :email, String, required: true
    argument :password, String, required: true
  end
end
