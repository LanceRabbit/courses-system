# frozen_string_literal: true

module V1
  module Entities
    class Course < Grape::Entity
      expose :title
      expose :price
      expose :category, merge: true, using: Entities::Category
      expose :currency
      expose :description
      expose :activation_period
    end
  end
end
