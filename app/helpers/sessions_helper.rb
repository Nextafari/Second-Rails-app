module SessionsHelper
  # Logs in the user
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Returns the current logged in user (if any)
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
  # This returns true if the user is logged in, and a false if the user is not
  def logged_in?
    #current user not nil(logged-in)? (true/false)
    !current_user.nil? 
  end
  
  # logs out the current user
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
end