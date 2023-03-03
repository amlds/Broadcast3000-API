class Event < ApplicationRecord
  belongs_to :event_type
  belongs_to :school
  validate :start_time_cant_be_end_time

  def start_time_cant_be_end_time
    if start_time > end_time && start_time == end_time
      errors.add(:start_time, "can't be the same as end time")
    end
end
