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
        command = AuthenticateUser.call(params[:email], params[:password])

        if command.success?
          { auth_token: command.result, status: :ok }
        else
          error!({ error: command.errors }, :unauthorized)
        end
      end
    end
  end
end
