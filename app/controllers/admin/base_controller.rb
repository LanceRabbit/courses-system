module Admin
  class BaseController < ApplicationController
    before_action :authenticate_admin

    private

    def authenticate_admin
      redirect_to root_path and flash[:alert] = '權限不足' unless current_user&.is_admin?
    end
  end
end
