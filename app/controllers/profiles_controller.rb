class ProfilesController < ApplicationController
  def index
  end

  def show
    @user = current_user
  end

  def new
  end

  def edit
    @user = current_user
  end

  def update
   @user.update(user_params)
  if @user.save
    redirect_to users_show_path(@user)
  else
    render :edit
  end
  end

  def delete
  end
end
