module Admin
  class CoursesController < ApplicationController
    before_action :set_course, only: %i[edit update]

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

    def edit; end

    def update
      if @course.update(course_params)
        flash[:notice] = 'updated course successfully'
        redirect_to admin_courses_path(@task)
      else
        flash[:alert] = 'updated course failure'
        render :edit
      end
    end

    private

    def course_params
      params.require(:course)
            .permit(:title, :description, :currency,
                    :price, :activation_period, :status,
                    :slug, :category_id)
    end

    def set_course
      @course = Course.find_by!(slug: params[:slug])
    end
  end
end
