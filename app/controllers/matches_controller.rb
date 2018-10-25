class MatchesController < ApplicationController

  before_action :redirect_dontlike, only: [:create]


  def new
    @match = Match.new
    #Read the json file
    sample()
    #Save the sampleuser in flash to be use in other methods
    flash['@sampleUser'] = @sampleUser
    #write in json the sampleuser as viewed
    #writejsonview()

  end

 def create
    @liker = current_user
    @likee = User.find(params[:profile_id])
    if @likee.likes_user(@liker) != []
      preexisting_match = @likee.likes_user(@liker).first
      preexisting_match.mutual = true
      preexisting_match.save
      # redirect_to profiles_path, alert: 'Congratulations it\'s a match!'
      @conversation = Conversation.new(match: preexisting_match)
      authorize @conversation
      @conversation.save
      redirect_to conversation_path(@conversation), alert: 'Congratulations it\'s a match!'
    else
      @match = Match.new(first_user: @liker, second_user: @likee)
      authorize @match
      @match.save
      redirect_to profiles_path, notice: 'You liked that person!'
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

  def match_params
    params.require(:match).permit(:user_id, :user_one_id, :user_two_id)
  end

  def redirect_dontlike
    user = User.find(current_user.id)
    if params[:cancel]
    redirect_to root_path()
    flash[:notice] = "you did not like"
    end
  end


  def sample
    # list of user that was not yet viewed by the current user
    listtosample = []
    file = open("./public/event.json")
    json = file.read
    @users = JSON.parse(json)

    #file = open("./public/views.json")
    #json = file.read
    #views_json= JSON.parse(json)
    #views_json.map { |u|
    #  if u["user_id"] = current_user.id

      #  u["views"].map { |v| }
      #  # u["views"][1][0]["id"]
      #         listtosample  << u["views"]
     # raise
     # end
   # }



    #random user
    @sampleUser = @users.sample(1)
    while @sampleUser[0][:id] == current_user.id
    @sampleUser = @users.sample(1)
    end
    return @sampleUser
  end

  def writejsonview
    @sampleUser = flash['@sampleUser']
    file = open("./public/views.json")
    json = file.read
    if json.empty?
    views_json = []
    else
    views_json = JSON.parse(json)
    end
    if views_json.empty?
             views_json = [{ "user_id" => current_user.id,
                      "views" =>  [
                                  {
                                   "id" => @sampleUser[0]["id"],
                                   "fist_name" => @sampleUser[0]["first_name"]
                                  }

                                  ]
                    }]

    else
        views_json.each do  |n|
          if n["user_id"] == current_user.id
            view_json = {
                     "views" =>
                        {
                        "id" => @sampleUser[0]["id"],
                        "fist_name" => @sampleUser[0]["first_name"]
                       }

                    }
            views_json[0]["views"] << view_json["views"]
          end
          if n["user_id"] != current_user.id
            view_json = [{ "user_id" => current_user.id,
                            "views" =>
                        {
                        "id" => @sampleUser[0]["id"],
                        "fist_name" => @sampleUser[0]["first_name"]
                       }
                        }]
            views_json << view_json
          end
        end

    end
    File.open("public/views.json","w") do |f|
      f.write(views_json.to_json)
    end

  end


end


