class MatchesController < ApplicationController

  before_action :redirect_dontlike, only: [:create]

  def new
    @match = Match.new
    @users = User.all
    #Read the json file
    file = open("./public/event.json")
    json = file.read
    @parsed = JSON.parse(json)

    @sampleUser = @parsed.sample(1)
    while @sampleUser[0][:id] == current_user.id
    @sampleUser = @parsed.sample(1)
    end



  end

  def create

    @match = Match.new(match_params)
    user = User.find(params[:match_id])
    # we need `event_id` to asssociate the discussion with corresponding event
    #if @match_user_one_id.present?
    #  @match.user_two_id = current_user.id
    #    if @match_user_one_id.present? || @match_user_two_id.present?
    #      flash[:notice] = "you have a match!"
    #    else
    #      flash[:notice] = "you like"
    #    end
    #else
    #    @match.user_one_id = current_user.id
    #end
    if @match.save
      redirect_to root_path
      flash[:notice] = "you like"
    end


  end



  def index
  end

  def show
  end

  def delete
  end

    def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    @match.update(match_params)
    if @match.save
      redirect_to edit_match_path(@match)
    else
      render :edit
    end
  end

    private

  def match_params
    params.require(:match).permit(:match_id, :user_one_id, :user_two_id)
  end

  def redirect_dontlike
    user = User.find(current_user.id)
    if params[:cancel]
    redirect_to root_path()
    flash[:notice] = "you did not like"
    end
  end


end
