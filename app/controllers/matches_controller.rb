class MatchesController < ApplicationController
  def new
    @match = Match.new

  end

  def create
    @match = Match.new()
    user = User.find(params[:user_id])
    # we need `event_id` to asssociate the discussion with corresponding event
    @join.user = current_user
    @join.save
    redirect_to roots_path()
    flash[:notice] = "you have a match!"
  end

  def index
  end

  def show
  end

  def delete
  end

    private

end
