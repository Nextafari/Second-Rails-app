class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  
  # This shows all the user on our database
  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end
  
  # Shows the user a new form to fill up when they make a get request to our sign up page
  def new
    @user = User.new
  end
  
  # This action shows the page of a user, using the find action and params to retrieve info from the database
  def show
    @user = User.find(params[:id])
    redirect_to root_path and return unless @user.activated?
    @microposts = @user.microposts.paginate(page: params[:page])
  end
  
  # This defines the following action
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end
  
  # This defines the follower(s) action
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
 # This action is invoked when a post request is made (when the form is submitted) 
  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.account_activation(@user).deliver_now
      flash[:info] = "Please check your email to activate your account"
      redirect_to root_path
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    # handles a successful update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile Updated"
      redirect_to user_path
    else
      render 'edit'
    end
  end
  
  # Deletes user from the database (for admins only)
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
  end
  
  # Before filters
  
  # confirms the correct user
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user) 
  end
  
  # Confirms the Admin user
  def admin_user
    redirect_to(root_path) unless current_user.present? && current_user.admin?
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end

  