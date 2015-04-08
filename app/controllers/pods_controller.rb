class PodsController < ApplicationController
  before_action :logged_in_user, only: [:new,:show, :edit, :update, :create, :destroy]
  def show
    @user=User.find(params[:user_id])
    @pod = Pod.find(params[:id])
  end

  #def index
  #  @pod=Pod.all
  #end
  
  def new
    @user=User.find(params[:user_id])
    @pod = @user.pods.build(params[:pod])
    #respond_with(@pod)
  end

    def create
    @pod = current_user.pods.build(pod_params)
    if @pod.save
      flash[:success] = "New White Whale Pod Created!"
      redirect_to current_user
    else
      render current_user# 'new' # this isn't right ? 
    end
  end
  
  def edit
    @user=User.find(params[:user_id])
    @pod = @user.pods.build(params[:pod])
  end

  def update
    @pod = Pod.find(params[:id])
    if @pod.update_attributes(pod_params)
      flash[:success] = "Pod updated"
      redirect_to @pod
    else
      render 'edit'
    end
  end

  def tagged
    if params[:tag].present? 
      @pods = Pods.tagged_with(params[:tag])
    else 
      @pods = Pods.postall
    end  
  end  
  private

  def pod_params
    params.require(:pod).permit( :name, :description, :photo, :tag_list) 
  end
  
end
