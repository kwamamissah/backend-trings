class Api::V1::UsersController < ApplicationController
  before_action :authenticate!, only: [:profile]

  def index
    @users = User.all
    render json: @users.to_json(:include =>  {:likes => {
      :include => :city_gem}}), status: :ok
  end

  def profile
    render json: current_user.profile_json, status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      token = JWT.encode({ user_id: @user.id }, ENV['SECRET'], 'HS256')
      render json: { token: token, username: @user.username, first_name: @user.first_name, id: @user.id }, status: :accepted
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
  end



  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :img_url)
  end

end
