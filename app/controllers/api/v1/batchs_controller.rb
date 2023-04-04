class Api::V1::BatchsController < ApplicationController
  before_action :set_batch, only: %i[update destroy]

  # POST /api/v1/school/1/batchs
  def create
    @school = School.find(params[:school_id])
    @batch = Batch.new(batch_params)

    if @batch.save
      render json: @batch, status: :created
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/batchs/1
  def update
    @batch = Batch.find(params[:id])
    if @batch.update(batch_params)
      render json: @batch
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/batchs/1
  def destroy
    @batch = Batch.find(params[:id])
    @batch.destroy
  end

  private

  def set_batch
    @batch = Batch.find(params[:id])
  end

  def batch_params
    params.require(:batch).permit(:number, :start_at, :end_at, :school_id, :course_id)
  end
end
