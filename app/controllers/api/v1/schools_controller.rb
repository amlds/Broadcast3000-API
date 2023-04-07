class Api::V1::SchoolsController < ApplicationController
  skip_before_action :authenticate_request, only: [:display]

  # GET /api/v1/display/:display_path
  def display
    @school = School.find_by(display_path: params[:display_path])
    if @school.nil?
      render json: { error: "School not found" }, status: :not_found
      return
    end
    @events = @school.events
    @batchs = Batch.current_batch(@school)
  end

  def update
    @school = School.find(params[:id])
    if @school.users.include?(@current_user)
      if @school.update(school_params)
        render json: @school
      else
        render json: @school.errors, status: :unprocessable_entity
      end
    end
  end

  private

  def school_params
    params.require(:school).permit(:display_path, :message_display, :nbr_carrousel)
  end
end
