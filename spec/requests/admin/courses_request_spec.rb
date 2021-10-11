require 'rails_helper'

RSpec.describe "Admin::Courses", type: :request do
  describe "Get Index" do
    it "can view all courese" do
      get admin_courses_path
      expect(response).to have_http_status(:ok)
    end
  end

  describe "Get Show" do
    subject { response }

    before do
      get admin_course_path({ slug: course.slug })
    end

    context "when find course by slug" do
      let(:course) { create(:course) }

      it { is_expected.to have_http_status(:ok) }
    end

    context "when not find course by slug" do
      let(:course) { build(:course) }

      it { is_expected.to have_http_status(:not_found) }
    end
  end

  describe "Post Create" do
    subject { post admin_courses_path(params) }

    let(:category) { create(:category) }

    context "when fill all fields" do
      let(:params) do
        {
          course: {
            title: 'new course',
            description: 'hello word',
            slug: 'new-course',
            price: 100.00,
            activation_period: 20,
            status: 'unpublished',
            currency: 'USD',
            category_id: category.id
          }
        }
      end

      it { is_expected.to redirect_to(admin_courses_path) }
    end

    context "when not fill all fields" do
      let(:params) { { course: { title: 'new course' } } }

      it { is_expected.to render_template(:new) }
    end
  end
end
