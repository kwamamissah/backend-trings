class Api::V1::CityGemsController < ApplicationController
  before_action :authenticate!, only: [:create]

  def index
    @gems = CityGem.all
    render json: @gems.to_json(:include => [ {:comments => {
      :include => :user}},:category, :likes])
  end

  def create
    @city_gem = CityGem.new(city_gem_params)
    if @city_gem.save
      render json: @city_gem, status: :created
    else
      render json: { errors: @city_gem.errors.full_messages }, status: :unprocessable_entity
    end
  end


  private
  def city_gem_params
    params.require(:city_gem).permit(:name, :description, :address, :category_id, :likes)
  end


end
