class Api::V1::BatchsController < ApplicationController
  before_action :set_batch, only: %i[show update destroy]

  def index
    @school = School.find(params[:school_id])
    @batchs = @school.batchs
    render json: @batchs
  end

  def show
    @school = School.find(params[:school_id])
    @batch = @school.batchs.find(params[:id])
    render json: @batch
  end

  def update
    @batch = Batch.find(params[:id])
    if @batch.update(batch_params)
      render json: @batch, status: :ok
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  def create
    @school = School.find(params[:school_id])
    @batch = @school.batchs.build(batch_params)
    if @batch.save
      render json: @batch, status: :created
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @batch = Batch.find(params[:id])
    @batch.destroy
    head :no_content
  end

  private

  def set_batch
    @batch = Batch.find(params[:id])
  end

  def batch_params
    params.require(:batch).permit(:name, :start_time, :end_time, :description)
  end
end
