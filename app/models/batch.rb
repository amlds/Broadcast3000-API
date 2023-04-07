class Batch < ApplicationRecord
  after_create_commit :create_batchchallenges

  belongs_to :school
  belongs_to :course
  has_many :batchchallenges, dependent: :destroy
  has_many :challenges, through: :batchchallenges

  validates :start_at, :number, presence: true

  def self.current_batch(school)
    # select all batches in progress for a school
    Batch.where(school_id: school.id).where("start_at <= ?", Date.today).where("end_at >= ?", Date.today)
  end

  def challenge_of_the_day
    # return the challenge of the day
    batchchallenges.where(day: Date.today).first.challenge
  end

  def create_batchchallenges
    # create batchchallenges for all challenges in the course
    current_day = 0

    course.challenges.each do |challenge|
      current_day += 2 if (start_at.to_date + current_day.day).strftime("%A") == "Saturday" # if start_at is sunday, we skip to monday

      Batchchallenge.create!(challenge:, batch: self, day: (start_at.to_date + current_day.day))
      current_day += 1
    end
  end
end
