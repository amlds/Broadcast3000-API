class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: %i[show update destroy]

  def index
    @school = School.find(params[:school_id])
    @events = @school.events
    render json: @events
  end

  def show
    @school = School.find(params[:school_id])
    @event = @school.events.find(params[:id])
    render json: @event
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      render json: @event, status: :ok
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def create
    @school = School.find(params[:school_id])
    p @school
    ap @school
    @event = @school.events.build(event_params)
    @event.event_type = EventType.find_by(id: params[:event][:event_type_id])
    if @event.save
      render json: @event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    head :no_content
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :start_time, :end_time, :description, :event_type)
  end
end
