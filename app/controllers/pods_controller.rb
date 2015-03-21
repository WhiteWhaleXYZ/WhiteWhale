class PodsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  def show
    @pod = Pod.find(params[:id])
  end

  def index
    @pod=Pod.all
  end
  
  def new
    @pod = Pod.new
  end
  
  def edit
    @pod = Pod.find(params[:id])
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

  def create
    @pod = Pod.new(pod_params)
    if @pod.save
      flash[:success] = "New White Whale Pod Created!"
      redirect_to @pod
    else
      render 'new'
    end
  end

  
  private

  def pod_params
    params.require(:pod).permit( :name, :description,:photo) 
  end
  
end
