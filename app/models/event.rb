class Event < ApplicationRecord
  belongs_to :event_type
  belongs_to :school
  validate :start_time_cant_be_end_time

  def start_time_cant_be_end_time
    if start_time > end_time
      errors.add(:start_time, 'cannot be after end time')
    elsif start_time == end_time
      errors.add(:start_time, 'cannot be the same end time')
    end
  end
end
