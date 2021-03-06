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
    mail = JoinMailer.with(join: @join, event: event).join_event
    mail.deliver_now
    redirect_to event_path(event)
    flash[:notice] = "See you at the event!"
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @join = Join.find(params[:id])
    @join.destroy
    redirect_to event_path(@event)
  end

    private

  def redirect_cancel
    event = Event.find(params[:event_id])
    redirect_to event_path(event) if params[:no]
  end


end
