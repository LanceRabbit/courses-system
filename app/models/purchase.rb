# == Schema Information
#
# Table name: purchases
#
#  id         :bigint           not null, primary key
#  currency   :string           not null
#  expired_at :datetime         not null
#  price      :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  course_id  :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_purchases_on_course_id  (course_id)
#  index_purchases_on_user_id    (user_id)
#
class Purchase < ApplicationRecord
  belongs_to :user, inverse_of: :purchases
  belongs_to :course, inverse_of: :purchases

  validates :expired_at, :user_id, :course_id, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: false
  validates :currency, presence: true, inclusion: { in: CoursesSystemConfig::CURRENCY }
end
