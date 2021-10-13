module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  end

  private

  def render_not_found
    respond_to do |format|
      format.html { render 'errors/not_found', status: :not_found }
      format.json { render json: { message: 'Not Found' }, status: :not_found }
      format.any  { render plain: 'Not Found', status: :not_found }
    end
  end
end
