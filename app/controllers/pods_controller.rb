class PodsController < ApplicationController
  def show
    @pod = Pod.find(params[:id])
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
      flash[:success] = "Profile updated"
      redirect_to @pod
    else
      render 'edit'
    end
  end
  

  private

  def pod_params
    params.require(:pod).permit(:id, :description,:photo) 
  end
  
end
