class WhalesController < ApplicationController
  #def index
  #end

  def show
  end

  def new
    @user=User.find(params[:user_id])
    @whales= @user.whales.build(params[:whales])
    #respond_with(@pod)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to White Whale!"
      redirect_to @user
    else
      render current_user
    end
  end

  def edit
    @whales=Whale.find(params[:id])
  end

  def update
  end

  def destroy
  end

end