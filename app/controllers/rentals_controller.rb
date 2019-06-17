class RentalsController < ApplicationController
  def new
    @rental = Rental.new
  end

  def create
    @rental = Rental.new(rental_params)
    @rental.user = current_user
    if @rental.save
      redirect_to rentals_path
    else
      render :new
    end
  end

  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def edit
  end

  def rental_params
    params.require(:rental).permit(:title, :description, :category, :latitude, :longitude, :phone, :price, :user_id, :picture)
  end

end

