class SessionsController < ApplicationController

  def new
  end

  #starts a new session to keep user logged in
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_back_or user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  #kills user session
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end