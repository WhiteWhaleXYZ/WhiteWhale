class PodsController < ApplicationController
  #defines what must be true to interact with pod controller
  before_action :logged_in_user, only: [:new,:show, :create, :destroy]
  before_action :correct_user,   only: [:new,:create, :destroy, :edit, :update]

  #show pod page
  def show
    @user=User.find(params[:user_id])
    @pod = Pod.find(params[:id])
    @whales = @pod.whales.paginate(page: params[:page])
  end

  #delete a pod
  def destroy
    @user=User.find(params[:user_id])
    @pod = Pod.find(params[:id])
    @pod.destroy
    flash[:success] = "Pod  deleted"
    redirect_to current_user
  end

  #get form
  def new
    @user=User.find(params[:user_id])
    @pod = @user.pods.build(params[:pod])
  end

  #create new pod
  def create
    @pod = current_user.pods.build(pod_params)
    if @pod.save
      flash[:success] = "New White Whale Pod Created!"
      redirect_to current_user
    else
      render current_user
    end
  end
  
  #get edit page
  def edit
    @pod = Pod.find(params[:id])
  end

  #update info from edit page
  def update
    @user= User.find(params[:user_id])
    @pod = Pod.find(params[:id])
    if @pod.update_attributes(pod_params)
      flash[:success] = "Pod updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #allow tagging
  def tagged
    if params[:tag].present? 
      @pods = Pods.tagged_with(params[:tag])
    else 
      @pods = Pods.postall
    end  
  end  

  private
  #what you can interact with
  def pod_params
    params.require(:pod).permit( :user_id, :name, :description, :photo, :tag_list) 
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:user_id])
    redirect_to(current_user) unless current_user?(@user)
  end
  
end
