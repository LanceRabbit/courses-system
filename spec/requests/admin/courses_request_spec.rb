require 'rails_helper'

RSpec.describe "Admin::Courses", type: :request do
  describe "Get Index" do
    it "include content" do
      get admin_courses_path
      expect(response.body).to include("Courses System")
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
end
