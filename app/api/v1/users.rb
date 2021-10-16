# frozen_string_literal: true

module V1
  class Users < Base
    namespace 'login' do
      desc 'User login'
      params do
        requires :email, type: String, desc: 'email'
        requires :password, type: String, desc: 'password'
      end

      post do
        user = ::User.find_by(email: params[:email])

        if user.present? && user&.authenticate(params[:password])
          token = ::JsonWebToken.encode(user_id: user.id)
          { auth_token: token, status: :ok }
        else
          error!({ message: "Invalid email or password" }, 401)
        end
      end
    end
  end
end
