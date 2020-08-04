class BookingsController < ApplicationController
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
  end

  def new
    @plant = Plant.find(params[:plant_id])
    @booking = Booking.new
  end

  def create
    @plant = Plant.find(params[:plant_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.plant = @plant
    if @booking.save
      redirect_to bookings_path
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
    params.require(:booking).permit(:beginning_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
