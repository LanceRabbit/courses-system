# frozen_string_literal: true

# == Schema Information
#
# Table name: courses
#
#  id                :bigint           not null, primary key
#  activation_period :integer          not null
#  currency          :string           not null
#  description       :text
#  price             :decimal(, )      not null
#  slug              :string           not null
#  status            :string           not null
#  title             :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  category_id       :bigint           not null
#
# Indexes
#
#  index_courses_on_category_id  (category_id)
#  index_courses_on_slug         (slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Course < ApplicationRecord
  belongs_to :category, inverse_of: :courses

  validates :title, :status, :currency, :category_id, presence: true
  validates :slug, presence: true, uniqueness: true
  validates :activation_period, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 30
  }, allow_nil: false
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: false
end
