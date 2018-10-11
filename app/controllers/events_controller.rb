class EventsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    @event.organiser = current_user.first_name
    @event.organiser_id = current_user.id
    if @event.save
      redirect_to event_path(@event)
    else
      render :new
    end
  end

  def index
    @events = Event.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@events) do |event, marker|
      marker.lat event.latitude
      marker.lng event.longitude
      marker.infowindow render_to_string(partial: "/events/map_box", locals: { event: event })
    end
    #@events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @hash = [{lat: @event.latitude, lng: @event.longitude}]

  end


  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :edit
    end
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
