class MatchesController < ApplicationController
  def new
    @match = Match.new
    @users = User.all
    @userlist = @users.map do |u|
    { :id => u.id, :first_name => u.first_name }
    end

    json = @userlist.to_json
    @exemple = @userlist.sample(1)
    while @exemple[0][:id] == current_user.id
    @exemple = @userlist.sample(1)
    end


    #Read the json file
    file = open("./public/event.json")
    json = file.read

    @parsed = JSON.parse(json)



  end

  def create

    @match = Match.new()
    user = User.find(params[:user_id])
    # we need `event_id` to asssociate the discussion with corresponding event
    @match.user = current_user
    if @match.save
      if user_one_id.present?
        user_two_id == current_user.id
        redirect_to roots_path()
        if user_one_id.present? || user_two_id.present?
          flash[:notice] = "you have a match!"
        else
          flash[:notice] = "you like"
        end
      else
        user_one_id == current_user.id
      end
    else
       redirect_to roots_path()
       flash[:notice] = "you did not like"
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
    params.require(:match).permit(:user_id)
  end

end
