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
    @join = Join.new()
    @join.event = @event
    @join.user = current_user
    if @event.save
      @join.save
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
    weather
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

  def weather
    # API open weather
    url_weather = "http://api.openweathermap.org/data/2.5/weather?lat=#{@hash[0][:lat]}&lon=#{@hash[0][:lng]}&units=metric&appid=#{ENV['WEATHER_KEY']}"
    url_weather_5days = "http://api.openweathermap.org/data/2.5/forecast?lat=#{@hash[0][:lat]}&lon=#{@hash[0][:lng]}&units=metric&appid=#{ENV['WEATHER_KEY']}"
    @weather = JSON.parse(open(url_weather).read)
    # conversion m/s into km/h for the wind speed of today
    @wind_speed_km = ((@weather["wind"]["speed"].to_f)*3.6).round(2)
    @weater_5days = JSON.parse(open(url_weather_5days).read)
    # we put the value of the wind in an array with 2 digit
    @weatherspeed_5days = Array.new
    for i in (0..22)
      @weatherspeed_5days << (@weater_5days["list"][i]["wind"]["speed"]).round(2)
      i+=2
    end

  end


end
