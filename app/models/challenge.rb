class Challenge < ApplicationRecord
  belongs_to :course
  has_many :batchchallenges
end
