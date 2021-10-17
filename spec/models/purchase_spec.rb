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
require 'rails_helper'

RSpec.describe Purchase, type: :model do
  describe '#associations' do
    it { is_expected.to belong_to(:user).inverse_of(:purchases) }
    it { is_expected.to belong_to(:course).inverse_of(:purchases) }
  end

  describe "validations" do
    subject { build(:purchase) }

    let(:user) { create(:user) }
    let(:course) { create(:course) }

    it { is_expected.to validate_presence_of(:currency) }
    it { is_expected.to validate_presence_of(:course_id) }
    it { is_expected.to validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
  end
end
