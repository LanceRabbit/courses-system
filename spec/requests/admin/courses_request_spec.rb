require 'rails_helper'

RSpec.describe "Admin::Courses", type: :request do
  describe "when without user" do
    describe "Get Index" do
      it "can not view all courese" do
        get admin_courses_path
        expect(response).to have_http_status(:found)
      end
    end
  end

  describe "when user is admin" do
    include_context "when authenticaion by admin"

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

    describe "Get Edit" do
      subject { response }

      before do
        get edit_admin_course_path(course.slug)
      end

      context "when find course by slug" do
        let(:course) { create(:course) }

        it { is_expected.to have_http_status(:success) }
      end

      context "when not find course by slug" do
        let(:course) { build(:course) }

        it { is_expected.to have_http_status(:not_found) }
      end
    end

    describe "Patch Update" do
      subject { patch admin_course_path({ slug: course.slug }), params: params }

      let(:category) { create(:category) }
      let(:course) { create(:course) }

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
        let(:params) { { course: { slug: ' ' } } }

        it { is_expected.to render_template(:edit) }
      end
    end

    describe "Delete Destroy" do
      let!(:course) { create(:course) }

      it "when destroy course" do
        expect { delete admin_course_path(course.slug) }.to change(Course, :count).by(-1)
      end
    end
  end
end
