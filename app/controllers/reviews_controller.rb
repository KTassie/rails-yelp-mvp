class ReviewsController < ApplicationController
  before_action :find_restaurant

  def new
    @review = @restaurant.reviews.build
  end

  def create
    @review = @restaurant.reviews.build(review_params)
    if review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: unprocessable_entity
    end
  end

  private # People can't see or touch stuff below

  def find_restaurant # Pulling up the restaurant ID to mess with it. 
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
