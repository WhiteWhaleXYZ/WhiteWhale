class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper

  # Confirms a logged-in user.
  def logged_in_user
    if logged_in?
      redirect_to current_user
    end
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to non_user_pages_home_path
    end
  end
  
end
