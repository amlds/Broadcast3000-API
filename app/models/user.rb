class User < ApplicationRecord
  require "securerandom"

  has_secure_password

  has_many :managers
  has_many :schools, through: :managers

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
end
