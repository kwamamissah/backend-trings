class Api::V1::LoginController < ApplicationController

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = JWT.encode({ user_id: @user.id }, ENV['SECRET'], 'HS256')
      render json: { token: token }, status: :accepted
    else
      render json: { errors: 'invalid login '}, status: :unauthorized
    end
  end
end
