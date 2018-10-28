class ProfilesController < ApplicationController

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end


  def index
    @users=User.all
    @profiles=Profile.all
    query = <<-SQL
      SELECT * FROM users u
      WHERE id NOT IN
      (
        SELECT user_two_id FROM matches WHERE user_one_id = :current_user_id
        UNION
        SELECT user_one_id FROM matches WHERE user_two_id = :current_user_id AND mutual = TRUE
        UNION
        SELECT user_two_id FROM dislikes WHERE user_one_id = :current_user_id
      )
      AND u.id != :current_user_id
    SQL

    users_allowed = User.find_by_sql([ query, { current_user_id: current_user.id }])
    @users = users_allowed #.sample(12, random: Random.new(number))
    @user = current_user
    @idUser = params[:idUser]


  end

  def show
      @profile = Profile.find(params[:id])
      @user = User.find(params[:id])
      @profile
  end

  def show_surfer
      @profile = Profile.find(params[:profile_id])
      @profile
  end


  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    @profile.update(profile_params)
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  def delete
  end

  def profile_params
    params.require(:profile).permit(:nickname, :address, :phone, :background_profile, :birth_date, :board_type, :need_to_rent, :surf_level, :favorite_beach, :i_like, :description_user, :photoprofile, :user_id, likecategory_ids:[])
  end

end
