module Admin
  class CoursesController < ApplicationController
    def index
      @courses = Course.all
    end

    def show
      @course = Course.find_by!(slug: params[:slug])
    end

    def new
      @course = Course.new
    end

    def create
      @course = Course.new(course_params)
      if @course.save
        flash[:notice] = 'created course successfully'
        redirect_to admin_courses_path
      else
        flash[:alert] = 'created course failure'
        render :new
      end
    end

    private

    def course_params
      params.require(:course)
            .permit(:title, :description, :currency,
                    :price, :activation_period, :status,
                    :slug, :category_id)
    end
  end
end
