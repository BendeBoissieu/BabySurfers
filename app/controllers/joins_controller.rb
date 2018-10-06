class JoinsController < ApplicationController
  before_action :redirect_cancel, only: [:create]

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
    if @join.save
    redirect_to event_path(event)
    flash[:notice] = "See you at the event!"
    end
  end

    private

  def redirect_cancel
    event = Event.find(params[:event_id])
    redirect_to event_path(event) if params[:no]
  end


end
