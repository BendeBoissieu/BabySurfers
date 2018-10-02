class JoinsController < ApplicationController
  def new
    @event= Event.find(params[:event_id])
    @join = Join.new
  end

  def create
    @join = Join.new()
    event = Event.find(params[:event_id])
    # we need `event_id` to asssociate the discussion with corresponding event
    @join.event = event
    @join.user = current_user
    @join.save
    redirect_to event_path(event)
    flash[:notice] = "See you at the event!"
  end
    private



end
