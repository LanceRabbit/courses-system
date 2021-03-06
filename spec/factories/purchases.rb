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
FactoryBot.define do
  factory :purchase do
    user
    course
    expired_at { course.activation_period.days.after }
    currency   { course.currency }
    price      { course.price }

    trait :expired do
      expired_at { Time.zone.yesterday }
    end
  end
end
