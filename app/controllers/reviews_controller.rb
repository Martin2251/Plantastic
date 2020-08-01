class ReviewsController < ApplicationController
  def new
    @plant = Plant.find(params[:plant_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking = Booking.find(params[:booking_id])
    @review.booking = @booking
    if @review.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @booking = @review.booking
    @review.destroy
    redirect_to booking_path(@booking)
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
