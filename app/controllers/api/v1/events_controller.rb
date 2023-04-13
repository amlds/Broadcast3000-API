class Api::V1::EventsController < ApplicationController
  before_action :set_event, only: %i[update destroy]

  def create
    @school = School.find(params[:school_id])
    @event = Event.new(event_params)
    @event.school = @school

    if @event.save!
      render :show, as: :event, status: :created
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def update
    return unless @event.users.include?(@current_user)

    if @event.update(event_params)
      render :show, as: :event, status: :ok
    else
      render json: @event.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @event.users.include?(@current_user)
      @event.destroy
      render json: @event, status: :ok
    else
      render json: @event.school.managers, status: :forbidden
    end
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.permit(:name, :start_time, :end_time, :description, :event_type_id, :photo)
  end
end
