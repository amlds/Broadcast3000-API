class Api::V1::SchoolsController < ApplicationController
  skip_before_action :authenticate_request, only: [:display]

  def index
    @schools = School.all
    render json: @schools
  end

  def display
    @school = School.find_by(display_path: params[:display_path])
    @events = @school.events
    ## TODO: create JSON for display with Jbuilder
  end

  def show
    @school = School.find(params[:id])
    render json: @school
  end

  def create
    @school = School.new(school_params)
    if @school.save
      render json: @school, status: :created
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  def update
    @school = School.find(params[:id])
    if @school.update(school_params)
      render json: @school
    else
      render json: @school.errors, status: :unprocessable_entity
    end
  end

  private

  def school_params
    params.require(:school).permit(:display_path, :message_display, :nbr_carrousel)
  end
end
