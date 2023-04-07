class School < ApplicationRecord
  belongs_to :city
  has_many :managers, dependent: :destroy
  has_many :users, through: :managers
  has_many :events, dependent: :destroy
  has_many :batchs, dependent: :destroy
end
