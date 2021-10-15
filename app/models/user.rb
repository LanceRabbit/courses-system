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
class User < ApplicationRecord
  has_many :purchases, dependent: :restrict_with_error

  has_secure_password
  validates :email, uniqueness: { case_sensitive: false }, presence: true

  before_validation :set_default_attributes, on: [:create]

  def set_default_attributes
    self.is_admin = false if is_admin.nil?
  end
end
