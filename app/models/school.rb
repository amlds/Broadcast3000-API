class School < ApplicationRecord
  belongs_to :city
  has_many :managers, dependent: :destroy
  has_many :events
  has_many :batchs
end
