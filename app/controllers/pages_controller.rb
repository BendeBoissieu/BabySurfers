class PagesController < ApplicationController
   skip_before_action :authenticate_user!, only: [:home,:about, :presentation_find]
  def home
  end
end

