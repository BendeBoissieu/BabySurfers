class MatchesController < ApplicationController
  def new
    @match = Match.new
    @users = User.all
    @userlist = @users.map do |u|
    { :id => u.id, :first_name => u.first_name }
    end

    json = @userlist.to_json
    exemple = @userlist.sample(1)
    while exemple[0][:id] == current_user.id
    exemple = @userlist.sample(1)
    end
    user = User.find(exemple[0][:id])


  end

  def create

    @match = Match.new()
    user = User.find(params[:user_id])
    # we need `event_id` to asssociate the discussion with corresponding event
    @match.user = current_user
    @match.save
    redirect_to roots_path()
    flash[:notice] = "you have a match!"
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
    params.require(:match).permit(:user_id)
  end

end
