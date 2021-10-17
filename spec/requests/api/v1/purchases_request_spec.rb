require 'rails_helper'

RSpec.describe "V1::Purchases", type: :request do
  describe 'Post /api/v1/purchases' do
    include_context "when authenticaion by user"
    let(:params) do
      {
        course_id: course.id
      }
    end

    before do
      post '/api/v1/purchases', params: params, headers: headers
    end

    context 'when purchasing published course' do
      let(:course) { create(:course, :published) }

      it 'create purchases successfully' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'when purchasing unpublished course' do
      let(:course) { create(:course) }

      it 'got error' do
        expect(JSON.parse(response.body)['error']['base']).to eq("The Course #{course.title} is unpublished")
      end
    end

    describe 'when purchasing course that is avaiabled' do
      let(:course) { create(:course, :published) }
      let(:purchase) { create(:purchase, user: user, course: course) }

      before do
        purchase
        post '/api/v1/purchases', params: params, headers: headers
      end

      it 'got error' do
        expect(JSON.parse(response.body)['error']['base']).to eq("The Course #{course.title} are still available")
      end
    end
  end
end
