class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: %i[update destroy]

  def index
    @school = School.find(params[:school_id])
    @events = @school.events
    render json: @events
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
    @event = Event.new(event_params)
    @event.school = @school
    @event.photo = params[:photo] if params[:photo].present?

    if @event.save!
      render :show, as: :event, status: :created
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
    params.permit(:name, :start_time, :end_time, :description, :event_type_id)
  end
end
