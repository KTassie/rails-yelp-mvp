class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show]

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews
    @new_review = @restaurant.reviews.build
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end
