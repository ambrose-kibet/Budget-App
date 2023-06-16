class HomeController < ApplicationController
  def index
    redirect_to user_groups_path(current_user) if user_signed_in?
  end
end
