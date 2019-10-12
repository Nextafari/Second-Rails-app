class PasswordResetsController < ApplicationController
  before_action :get_user, only: [:edit, :update]
  before_action :valid_user, only: [:edit, :update]
  before_action :check_expiration, only: [:edit, :update] 
  
  def new
  end
  
  # This creates a reset password token after finding the user in the db
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
       @user.create_reset_digest
       @user.send_password_reset_email
       flash[:info] = "Email sent with password reset instructions"
      redirect_to root_path
    else
      flash.now[:danger] = "Email not found"
      render "new"
    end
  end
  
  def edit
  end
  
  def update
    if params[:user][:password].empty?            #when user leaves password blank
      @user.errors.add(:password, "can't be empty")     
      render 'edit'
    elsif @user.update_attributes(user_params)     #when user successfully changes password
      log_in @user
      @user.update_attribute(:reset_digest, nil)     #This sets the reset token to nil after the user has used it; as a security measure so no one else can use this to reset the password
      flash[:success] = "Password successfully changed"
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  # This action assigns a variable to look for the user in the db 
  def get_user
    @user = User.find_by(email: params[:email])
  end
  
  # Permits both the password and password confirmation attributes
  def user_params
    params.require(:user).permit(:password, :password_confirmation)
  end
  
  #This confirms a valid user
  def valid_user
    unless (@user && @user.activated? && @user.authenticated?(:reset, params[:id]))
      redirect_to root_path
    end
  end

  # This actions checks expiration of passoword reset token 
  def check_expiration
    if @user.password_reset_expired?
      flash[:danger] = "Password link has expired"
      redirect_to new_password_reset_url
    end
  end

end
