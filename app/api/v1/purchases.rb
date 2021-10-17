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

      desc 'serach purchased courses'
      params do
        optional :category_id, type: Integer, desc: 'course id'
        optional :avaiabled, type: Boolean, desc: 'avaiable course'
      end
      get do
        result = PurchasesFinder.new(params: params,
                                     resources: current_user.purchases
                                                            .includes(course: :category)
                                                            .joins(course: :category)).call

        present result, with: Entities::Purchase
      end
    end
  end
end
