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

    #sql_query = "category CATEGORY :query"
    #@rentals = Rental.all.where(sql_query, query:"%#{params[:query]}%").order(created_at: :desc))
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def contact_owner
    @rental = Rental.find(params[:rental_id])
    @liker = current_user
    @likee = User.find(@rental.user_id)
    if @liker == @likee
      redirect_to rental_path(@rental), alert: 'You are the owner'
    else
      if  (Match.where(user_one_id: @liker, user_two_id: @likee) || Match.where(user_one_id: @likee, user_two_id: @liker)) == []
        @match = Match.new(user_one_id: @liker.id, user_two_id: @likee.id)
        @match.mutual = true
        @match.save
        @conversation = Conversation.new(match: @match)
        @conversation.save
        redirect_to conversation_path(@conversation), alert: 'You can know start a conversation!'
      else
        redirect_to rental_path(@rental), alert: 'You already have a conversation with this owner'
      end
    end
  end


  def edit
    @rental = Rental.find(params[:id])
  end

  def update
    @rental = Rental.find(params[:id])
    @rental.update(rental_params)
    if @rental.save
      redirect_to rental_path(@rental)
    else
      render :edit
    end
  end

  def destroy
    @rental = Rental.find(params[:id])
    @rental.destroy
    redirect_to rentals_path
  end

  def rental_params
    params.require(:rental).permit(:title, :description, :category, :latitude, :longitude, :phone, :price, :user_id, :picture)
  end

end

