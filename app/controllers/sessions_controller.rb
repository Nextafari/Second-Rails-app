class SessionsController < ApplicationController
  
  def new
  end
  
  # Log the user in and redirect to the user's show page.
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        remember user
        flash.now[:success] = "Signed in successfully"
        redirect_back_or user
      else
        message = "Account not Activated"
        message += "Check your email for activation link"
        flash[:warning] = message
        redirect_to root_path
      end
    else
      # create an error message and show form again.
      flash.now[:danger] = "Something went wrong, please try again"
      render 'new'
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_path
  end
  
end
