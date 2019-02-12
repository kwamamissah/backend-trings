class Api::V1::LikesController < ApplicationController
  before_action :authenticate!
  before_action :find_city_gem, only: [:create]
  before_action :find_like, only: [:destroy]

  def create
    if already_liked?
    @like = Like.where(user_id: current_user, city_gem_id: params[:city_gem_id])
    render json: @like
  else
    @like = @city_gem.likes.create(user_id: current_user.id)
    render json: @like

    end
  end


  def destroy
    if !(already_liked?)
      render json: { errors: @like.errors.full_messages }, status: :conflict
  else
      @like.destroy
    end
  end


  def find_like
    @like = @city_gem.likes.find(params[:id])
  end

  private

  def find_city_gem
    @city_gem = CityGem.find(params[:city_gem_id])
  end

  def already_liked?
    Like.where(user_id: current_user, city_gem_id:
    params[:city_gem_id]).exists?
  end

end
