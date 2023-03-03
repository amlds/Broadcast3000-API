class Batch < ApplicationRecord
  belongs_to :school
  belongs_to :course
  validates :start_at, :number, presence: true
end
