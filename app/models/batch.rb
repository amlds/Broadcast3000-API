class Batch < ApplicationRecord
  after_create_commit :create_batchchallenges

  belongs_to :school
  belongs_to :course
  has_many :batchchallenges
  has_many :challenges, through: :batchchallenges

  validates :start_at, :number, presence: true

  def self.current_batch(school)
    # select all batches in progress for a school
    Batch.where(school_id: school.id).where("start_at <= ?", Date.today).where("end_at >= ?", Date.today)
  end

  def challenge_of_the_day
    # return the challenge of the day
    self.batchchallenges.where(day: Date.today).first.challenge
  end

  def create_batchchallenges
    # create batchchallenges for all challenges in the course
    day = 0
    saturday_day = 5

    self.course.challenges.each do |challenge|
      if day.zero?
        Batchchallenge.create!(challenge: challenge, batch: self, day: start_at.to_date)
      elsif (day % saturday_day).zero? # if day is saturday, we skip to monday
        day += 2
        Batchchallenge.create!(challenge: challenge, batch: self, day: (start_at.to_date + day.day))
        saturday_day += 7
      else
        Batchchallenge.create!(challenge: challenge, batch: self, day: (start_at.to_date + day.day))
      end
      day += 1
    end
  end
end
