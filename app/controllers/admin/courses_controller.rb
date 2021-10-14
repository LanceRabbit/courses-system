module Admin
  class CoursesController < BaseController
    before_action :set_course, only: %i[show edit update destroy]

    def index
      @courses = Course.all
    end

    def show; end

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

    def destroy
      flash[:notice] = 'destroy the course successfully' if @course&.destroy

      redirect_to admin_courses_path
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
