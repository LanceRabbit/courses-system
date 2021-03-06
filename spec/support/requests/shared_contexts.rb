# frozen_string_literal: true

RSpec.shared_context 'when authenticaion by admin' do
  let(:user) { create(:user, :admin) }
  let(:login_params) do
    {
      session: {
        email: user.email,
        password: '12345678'
      }
    }
  end
  before do
    post sessions_path(login_params)
  end
end

RSpec.shared_context 'when authenticaion by user' do
  let(:user) { create(:user) }
  let(:auth_token) { AuthenticateUser.call(user.email, user.password).result }

  let(:headers) do
    {
      Authorization: "Bearer #{auth_token}"
    }
  end
end
