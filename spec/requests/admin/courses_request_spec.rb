require 'rails_helper'

RSpec.describe "Admin::Courses", type: :request do
  describe "Get Index" do
    it "include content" do
      get admin_courses_path
      expect(response.body).to include("Courses System")
    end
  end
end
