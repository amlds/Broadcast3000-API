class Api::V1::EventTypesController < ApplicationController
  before_action :set_event_type, only: [:show, :update, :destroy]

  # GET /api/v1/event_types
  def index
    @event_types = EventType.all
    render json: @event_types
  end

  # GET /api/v1/event_types/1
  def show
    @event_types = EventType.find(params[:id])
    render json: @event_type
  end

  # POST /api/v1/event_types
  def create
    @event_type = EventType.new(event_type_params)

    if @event_type.save
      render json: @event_type, status: :created
    else
      render json: @event_type.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/event_types/1
  def update
    if @event_type.update(event_type_params)
      render json: @event_type
    else
      render json: @event_type.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/event_types/1
  def destroy
    @event_type.destroy
  end

  private

  def set_event_type
    @event_type = EventType.find(params[:id])
  end

  def event_type_params
    params.require(:event_type).permit(:name, :color)
  end
end
