class Api::V1::ChallengesController < ApplicationController
  def index
    @course = Course.find(params[:course_id])
    @challenges = @course.challenges
    render json: @challenges
  end

  def show
    @course = Course.find(params[:course_id])
    @challenge = @course.challenges.find(params[:id])
    render json: @challenge
  end
end
