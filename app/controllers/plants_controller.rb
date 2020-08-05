class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index]
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def home; end

  def index
    @plants = policy_scope(Plant)
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @plant = current_user.plant.new
    authorize @plant
  end

  def edit; end

  def create
    @plant = current_user.plant.new(plant_params)
    authorize @plant
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :new
    end
  end


  def update
    @plant.update(plant_params)
    if @plant.save
      redirect_to plant_path(@plant)
    else
      render :edit
    end
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
    authorize @plant
  end
end
