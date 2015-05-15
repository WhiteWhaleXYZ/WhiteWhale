class UsersController < ApplicationController
  #defines what must be true to interact with user controller
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  #gets an index of all users
  def index
    @users = User.paginate(page: params[:page])
  end

  #displays users page
  def show
    @user = User.find(params[:id])
    @pods = @user.pods.paginate(page: params[:page])
  end

  #gets info for new user form page
  def new
    @user = User.new
  end

  #creates new user from info taken from form 
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to White Whale!"
      redirect_to @user
    else
      render 'new'
    end
  end

  #gets info for user from user edit form page
  def edit
    @user = User.find(params[:id])
  end

  #updates user from info taken from form
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  #deletes a user
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  #allows user to fork a pod using info from user and pod
  #Uses amoeba to deep copy pods and whales updating links between 
  #them for new users
  def fork
      @pod = Pod.find(params[:thisPod])
      @newPod = @pod.amoeba_dup
      @user = User.find_by(id: session[:user_id])
      
      @newPod.update_attributes(user_id: @user.id)
      @newPod.save
      redirect_to current_user
    
  end

  private

  #defines what you can interact with
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :photo, :description, :location)
  end

  
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = "Please log in."
      redirect_to login_url
    end
  end

  # Confirms the correct user.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  #confirms admin user
  def admin_user
    redirect_to(root_url) unless current_user.admin?
  end
end
