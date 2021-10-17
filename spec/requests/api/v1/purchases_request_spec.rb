require 'rails_helper'

RSpec.describe "V1::Purchases", type: :request do
  include_context "when authenticaion by user"

  describe 'Post /api/v1/purchases' do
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

    describe 'when course that is not exist' do
      let(:course) { build(:course, :published) }

      it 'got error' do
        expect(JSON.parse(response.body)['error']['base']).to eq("Couldn't find Course without an ID")
      end
    end
  end

  describe 'Get /api/v1/purchases' do
    let(:courses) { create_list(:course, 10, :published) }
    let(:course) { create(:course, :published) }
    let(:purchases) { create_list(:purchase, 2, user: user, course: courses.first) }
    let(:purchase) { create(:purchase, user: user, course: courses.last) }
    let(:expired_purchase) { create(:purchase, :expired, user: user, course: course) }

    before do
      purchases
      purchase
      expired_purchase
      get '/api/v1/purchases', params: params, headers: headers
    end

    context 'when search without params' do
      let(:params) { {} }

      it 'get all purchased courses' do
        expect(JSON.parse(response.body).size).to eq(4)
      end
    end

    context 'when search by category_id' do
      let(:params) { { category_id: purchase.course.category_id } }

      it 'will got data' do
        expect(JSON.parse(response.body).size).to eq(1)
      end
    end

    context 'when search by avaiabled' do
      let(:params) { { avaiabled: true } }

      it 'will got data' do
        expect(JSON.parse(response.body).size).to eq(3)
      end
    end

    context 'when search by category_id and avaiabled' do
      let(:params) do
        {
          category_id: purchases.first.course.category_id,
          avaiabled: true
        }
      end

      it 'will got data' do
        expect(JSON.parse(response.body).size).to eq(2)
      end
    end
  end
end
