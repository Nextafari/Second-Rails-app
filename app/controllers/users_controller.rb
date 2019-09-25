class UsersController < ApplicationController
  
  # Shows the user a new form to fill up when they make a get request to our sign up page
  def new
    @user = User.new
  end
  
  # This action shows the page of a user, using the find action and params to retrieve info from the database
  def show
    @user = User.find(params[:id])
  end

 # This action is invoked when a post request is made (when the form is submitted) 
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the app!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

end

  