class User < ApplicationRecord
  require "securerandom"

  has_secure_password

  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true

  has_many :members
  has_many :teams, through: :members
end
