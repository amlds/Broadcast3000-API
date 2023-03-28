class Batch < ApplicationRecord
  belongs_to :school
  belongs_to :course
  validates :start_at, :number, presence: true

  def self.current_batch(school)
    # select all batches in progress for a school
    Batch.where(school_id: school.id).where("start_at <= ?", Date.today).where("end_at >= ?", Date.today)
  end
end
