require 'rails_helper'

RSpec.describe "V1::Users", type: :request do
  describe 'Post /api/v1/login' do
    let(:user) { create(:user) }

    before do
      post '/api/v1/login', params: params
    end

    context 'with correct email and passwor' do
      let(:params) do
        {
          email: user.email,
          password: user.password
        }
      end

      it 'return auth_token' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with incorrect email and passwor' do
      let(:params) do
        {
          email: 'wrong@mail.com',
          password: '1234567890'
        }
      end

      it 'return unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'got error message' do
        expect(JSON.parse(response.body)['message']).to eq("Invalid email or password")
      end
    end
  end
end
