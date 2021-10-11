module Admin
  class CoursesController < ApplicationController
    def index; end

    def show
      @course = Course.find_by!(slug: params[:slug])
    end
  end
end
