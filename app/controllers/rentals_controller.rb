class RentalsController < ApplicationController
  def new
    @rental = Rental.new
  end

  def index
    @rentals = Rental.all
  end

  def show
  end

  def edit
  end
end
