class Batch < ApplicationRecord
  belongs_to :school
  belongs_to :course
  has_many :batchchallenges
  validates :start_at, :number, presence: true

  def self.current_batch(school)
    # select all batches in progress for a school
    Batch.where(school_id: school.id).where("start_at <= ?", Date.today).where("end_at >= ?", Date.today)
  end

  def associate_challenges_to_batch
    # associate challenges to batch
    challenges = Challenge.where(course: self.course)
    challenges.each do |challenge|
      BatchChallenge.create!(batch_id: self.id, challenge_id: challenge.id)
    end
  end
end
