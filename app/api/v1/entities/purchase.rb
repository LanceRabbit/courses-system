# frozen_string_literal: true

module V1
  module Entities
    class Purchase < Grape::Entity
      format_with(:date_format) do |date|
        date.strftime('%Y-%m-%d')
      end

      expose :expired_at, format_with: :date_format
      expose :created_at, as: :purchased_date, format_with: :date_format
      expose :course, using: Entities::Course
    end
  end
end
