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
FactoryBot.define do
  factory :course do
    title              { 'new course' }
    slug               { 'test_slug' }
    price              { 100.00 }
    activation_period  { 1 }
    status             { 'unpublished' }
    currency           { 'USD' }
    category           { create(:category) }
  end
end
