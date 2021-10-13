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
require 'rails_helper'

RSpec.describe Course, type: :model do
  describe '#associations' do
    it { is_expected.to belong_to(:category).inverse_of(:courses) }
  end

  describe "validations" do
    subject { build(:course) }

    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_presence_of(:currency) }
    it { is_expected.to validate_presence_of(:category_id) }
    it { is_expected.to validate_uniqueness_of(:slug) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }

    it {
      is_expected.to validate_numericality_of(:activation_period).only_integer
                                                                 .is_less_than_or_equal_to(30)
                                                                 .is_greater_than_or_equal_to(1)
    }
  end

  describe 'update slug field' do
    let(:course_1) { create(:course) }
    let(:course_2) { create(:course) }

    it 'when slug not duplicated' do
      expect(course_1.update(slug: 'change-is-ok')).to be_truthy
    end

    it 'when slug duplicated' do
      expect(course_1.update(slug: course_2.slug)).to be_falsey
    end
  end
end
