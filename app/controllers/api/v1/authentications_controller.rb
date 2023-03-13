class Api::V1::AuthenticationsController < ApplicationController
  skip_before_action :authenticate_request

  def login
    @user = User.find_by(email: params.dig(:user, :email))
    if @user && @user.authenticate(params.dig(:user, :password))
      token = jwt_encode(user_id: @user.id)
      render json: { token: token }, status: :ok
    else
      render json: { error: "Invalid username/password" }, status: :unauthorized
    end
  end
end
