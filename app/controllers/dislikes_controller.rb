class DislikesController < ApplicationController
    def create
    disliked_person = User.find(params[:profile_id])
    user_pressed_btn = current_user
    dislike = Dislike.new(user_one_id: user_pressed_btn.id, user_two_id: disliked_person.id)
    if dislike.save
      redirect_to profiles_path, alert: 'You dislike'
    else
      redirect_to profile_path(disliked_person)
    end
  end
end
