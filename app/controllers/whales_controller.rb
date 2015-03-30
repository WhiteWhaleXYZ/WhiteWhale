class WhalesController < ApplicationController
  #def index
  #end
 
  def show

  end

  def new
    @user=User.find(params[:user_id])
    @pod = Pod.find(params[:user_id],params[:pod_id])
    @whales= @pod.whales.build(params[:whales])
    #respond_with(@pod)
  end

  def create
    @user=User.find(params[:user_id])
    @pod = Pod.find(params[:user_id],params[:pod_id])
    @whales= @pod.whales.build(params[:whales])

    if @whales.save
      flash[:success] = "New White Whale Created!"
      redirect_to user_pod_whales_path(@user, @pod, @whales)
    else
      redirect_to user_pod_path(@user, @pod)# 'new' # this isn't right ?
    end
  end

  def edit
    @whales=Whale.find(params[:id])
  end

  def update
  end

  def destroy
  end

  private

  def whale_params
    params.require(:whale).permit( :name, :description, :photo, :tag_list) 
  end

end