class DiscussionsController < ApplicationController

  before_action :redirect_cancel, only: [:create]

  def new
    @event= Event.find(params[:event_id])
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(discussion_params)
    event = Event.find(params[:event_id])
    # we need `event_id` to asssociate the discussion with corresponding event
    @discussion.event = event
    @discussion.user = current_user
    if @discussion.save
      redirect_to event_path(event)
    end
  end


  def index
  end


  def edit
  end

  def delete
  end

    private

  def discussion_params
    params.require(:discussion).permit(:message_event, :user_id, :event_id)
  end


  def redirect_cancel
    event = Event.find(params[:event_id])
    redirect_to event_path(event) if params[:cancel]
  end
end
