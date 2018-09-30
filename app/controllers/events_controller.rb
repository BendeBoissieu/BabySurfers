class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end


  def index
    @events = Event.all
  end

  def show
    @evemt = Event.find(params[:id])
  end


  def edit
    @event = Event.find(params[:id])
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to events_path
  end

  private

  def event_params
    params.require(:event).permit(:title_event, :description, :start_at, :end_at, :location, :photo_event, :organiser, :user_id)
  end


end
