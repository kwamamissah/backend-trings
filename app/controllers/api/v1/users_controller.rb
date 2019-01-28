class Api::V1::UsersController < ApplicationController
  def new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: @user, status: :created
    else
      render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def show
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :username, :email, :password, :img_url)
  end

end
