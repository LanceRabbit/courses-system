# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  is_admin        :boolean          not null
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    subject { build(:user, :admin) }

    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
  end

  describe "#is_admin?" do
    subject { user.is_admin? }

    context "when is_admin is true" do
      let(:user) { create(:user, :admin) }

      it { is_expected.to be_truthy }
    end

    context "when is_admin is nil" do
      let(:user) { create(:user) }

      it { is_expected.to be_falsey }
    end
  end
end
