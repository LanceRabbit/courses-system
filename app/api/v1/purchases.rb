# frozen_string_literal: true

module V1
  class Purchases < Base
    resource :purchases do
      before { authenticate_user! }
      desc 'purchasing course'
      params do
        requires :course_id, type: Integer, desc: 'course id'
      end

      post do
        command = PurchasingCourse.call(current_user, params[:course_id])
        if command.success?
          { message: 'Purchasing course successfully', status: :created }
        else
          error!({ error: command.errors }, :forbidden)
        end
      end
    end
  end
end
