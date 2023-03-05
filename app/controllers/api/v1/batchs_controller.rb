class Api::V1::BatchsController < ApplicationController
  before_action :set_batch, only: %i[show update destroy]

  # GET /api/v1/school/1/batchs
  def index
    @school = School.find(params[:school_id])
    @batchs = @school.batchs
    render json: @batchs
  end

  # GET /api/v1/school/1/batchs/1
  def show
    @school = School.find(params[:school_id])
    @batch = @school.batchs.find(params[:id])
    render json: @batch
  end

  # POST /api/v1/school/1/batchs
  def create
    @school = School.find(params[:school_id])
    @batch = @school.batchs.build(batch_params)
    if @batch.save
      render json: @batch, status: :created
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  # PUT /api/v1/school/1/batchs/1
  def update
    @batch = Batch.find(params[:id])
    if @batch.update(batch_params)
      render json: @batch
    else
      render json: @batch.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/school/1/batchs/1
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
