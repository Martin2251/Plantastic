class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @bookings = Booking.where(user: current_user)
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @booking = Booking.new(booking_params)
    @booking.plant = @plant
    @booking.user = current_user
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @booking.update(booking_params)
    redirect_to booking_path
  end

  def destroy
    @booking.destroy
    redirect_to plants_path
  end

  private

  def booking_params
    params.require(:booking).permit(:beginning_date, :end_date, :status)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
