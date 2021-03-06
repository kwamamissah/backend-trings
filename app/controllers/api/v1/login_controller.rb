class Api::V1::LoginController < ApplicationController

  def login
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password])
      token = JWT.encode({ user_id: @user.id }, ENV['SECRET'], 'HS256')
      render json: { token: token, username: @user.username, first_name: @user.first_name, id: @user.id }, status: :accepted
    else
      render json: { errors: 'invalid login: check username && password '}, status: :unauthorized
    end
  end
end
