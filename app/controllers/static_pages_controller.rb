class StaticPagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to user_presentations_path current_user
    else
      redirect_to new_user_session_path
    end
  end
end
