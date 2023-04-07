class Event < ApplicationRecord
  # after_create_commit { broadcast_event }

  has_one_attached :photo

  belongs_to :event_type
  belongs_to :school
  has_many :managers, through: :school
  has_many :users, through: :managers

  validate :start_time_cant_be_end_time

  private

  def broadcast_event
    ActionCable.server.broadcast "EventsChannel", partial: "api/v1/events/event", locals: {
                                                    event: self,
                                                  }
  end

  def start_time_cant_be_end_time
    if start_time > end_time
      errors.add(:start_time, "cannot be after end time")
    elsif start_time == end_time
      errors.add(:start_time, "cannot be the same end time")
    end
  end
end
