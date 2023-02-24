class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: %i[show update destroy]

  def index
    school = School.find(params[:school_id])
    events = school.events
    render json: events
  end

  def show
    @event = Event.find(params[:id])
  end

  def update
    @event.update(event_params)
  end

  def create
    @event = Event.new(event_params)
    @event.school = School.find(params[school_id])

    @event.save
  end

  def destroy
    @event.destroy
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :start_time, :end_time, :description, :event_type)
  end
end
