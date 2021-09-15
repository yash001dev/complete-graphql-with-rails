module Mutations
  class SignInUser < BaseMutation
    null true
    argument :credentails, Types::AuthProviderCrendentialsInput, required: false

    field :token, String, null: true
    field :user, Types::UserType, null: true

    def resolve(credentails: nil)
      return unless credentails

      user = User.find_by email: credentails[:email]

      return unless user
      return unless user.authenticate(credentails[:password])

      crypt = ActiveSupport::MessageEncryptor.new(Rails.application.crendentails.secret_key_base.byteslice(0..31))
      token = crypt.encrypt_and_sign("user-id:#{user.id}")
      { user: user, token: token }
    end
  end
end
