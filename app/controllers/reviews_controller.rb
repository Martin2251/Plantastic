class ReviewsController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
    authorize @review
  end

  def edit; end

  def create
    @booking = Booking.find(params[:booking_id])
    @review = Review.new(review_params)
    @booking.user = current_user
    authorize @review
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
    params.require(:review).permit(:comment, :rating)
  end
end
