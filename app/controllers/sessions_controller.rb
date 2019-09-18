class SessionsController < ApplicationController
  def new
  end
  
  # Log the user in and redirect to the user's show page.
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      flash.now[:success] = "Signed in successfully"
      redirect_to user
    else
      # create an error message and show form again.
      flash.now[:danger] = "Something went wrong, please try again"
      render 'new'
    end
  end
  
  def destroy
  end
  
end
