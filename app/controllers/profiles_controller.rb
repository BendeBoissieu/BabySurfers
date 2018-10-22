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

  end

  def show
      @profile = Profile.find(params[:id])
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
