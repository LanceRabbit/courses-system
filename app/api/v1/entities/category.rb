# frozen_string_literal: true

module V1
  module Entities
    class Category < Grape::Entity
      expose :name, as: :category
    end
  end
end
