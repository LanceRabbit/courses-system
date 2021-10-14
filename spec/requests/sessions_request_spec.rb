require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "Get new" do
    it "when no user login" do
      get login_path
      expect(response).to have_http_status(:ok)
    end

    context "when user has been login" do
      let(:user) { create(:user) }
      let(:params) do
        {
          session: {
            email: user.email,
            password: '12345678'
          }
        }
      end

      before do
        post sessions_path(params)
      end

      it 'will redicet to admin root' do
        get login_path
        expect(response).to redirect_to(admin_root_path)
      end
    end
  end

  describe "Post create" do
    subject { post sessions_path(params) }

    let(:user) { create(:user) }

    context "with correct email and password" do
      let(:params) do
        {
          session: {
            email: user.email,
            password: '12345678'
          }
        }
      end

      it { is_expected.to redirect_to(admin_root_path) }
    end

    context "with incorrect email or password" do
      let(:params) do
        {
          session: {
            email: user.email,
            password: '11111'
          }
        }
      end

      it { is_expected.to render_template(:new) }
    end
  end
end
