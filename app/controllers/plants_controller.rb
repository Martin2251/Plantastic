class PlantsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]
  before_action :set_plant, only: [:show, :edit, :update, :destroy]

  def home; end

  def index
    if params[:query].present?
      @plants = Plant.search_plant(params[:query])
    else
      @plants = policy_scope(Plant)
    end

    # @plants = Plant.geocoded
    # @markers = @plants.map do |plant|
    #   {
    #     lat: plant.latitude,
    #     lng: plant.longitude
    #   }
    # end
  end

  def show
    @booking = Booking.new
    @review = Review.new
  end

  def new
    @plant = Plant.new
    authorize @plant
  end

  def edit; end

  def create
    @plant = Plant.new(plant_params)
    @plant.user = current_user
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
    params.require(:plant).permit(:name, :species, :category, :price, :address, :description, photos: [])
  end

  def set_plant
    @plant = Plant.find(params[:id])
    authorize @plant
  end
end
