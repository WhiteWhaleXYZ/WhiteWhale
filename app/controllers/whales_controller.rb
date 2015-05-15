class WhalesController < ApplicationController
  #defines what must be true to interact with whale controller
  before_action :logged_in_user, only: [:new,:show, :create, :destroy]
  before_action :correct_user,   only: [:new, :create, :destroy]
  
 
  def show

  end

  #gets info for new whale form page
  def new
    @user=User.find(params[:user_id])
    @pod = Pod.find(params[:pod_id])
    @whale= @pod.whales.build(params[:whale])
  end

  #creates new whale from info taken from form 
  def create
    @user=User.find(params[:user_id])
    @pod = Pod.find(params[:pod_id])
    @whale= @pod.whales.build(whale_params)

    if @whale.save
      flash[:success] = "New White Whale Created!"
      redirect_to user_pod_path(@user, @pod)
    else
      redirect_to user_pod_path(@user, @pod)
    end
  end

  #gets info for whale from whale edit form page
  def edit
    @whales=Whale.find(params[:id])
  end

  #updates whale from info taken from form
  def update
    @user= User.find(params[:user_id])
    @pod = Pod.find(params[:pod_id])
    @whale = Whale.find(params[:id])
    if @whale.update_attributes(whale_params)
      flash[:success] = "Whale updated"
      redirect_to user_pod_path( params[:user_id],@pod.id)
    else
      render 'edit'
    end
  end

  def destroy
  end

  private

  #defines what you can interact with
  def whale_params
    params.require(:whale).permit( :owned, :name, :description, :photo, :tag_list) 
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(current_user) unless current_user?(@user)
  end
end
