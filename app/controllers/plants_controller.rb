class PlantsController < ApplicationController
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def home; end

  def index
    @plants = Plant.all
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @plant = Plant.new
  end

  def create
    @plant = Plant.new(plant_params)
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end

  def edit; end

  def update
    @plant.update(plant_params)
    redirect_to @plant
  end

  def destroy
    @plant.destroy
    redirect_to plants_path
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :photo, :species, :category, :price, :address, :description)
  end

  def set_plant
    @plant = Plant.find(params[:id])
  end
end
