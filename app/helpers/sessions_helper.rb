module SessionsHelper
  # Logs in the user
  def log_in(user)
    session[:user_id] = user.id
  end
  
  # Remembers a user in a persistent session
  def remember(user)
    user.remember
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
  
  # Returns the current user logged in if (any)
  def current_user
    if (user_id = session[:user_id])
    @current_user ||= User.find_by(id: session[:user_id])
    elsif (user_id = cookies.signed[:user_id])
      raise 
      user = User.find_by(id: user_id)
      if user && user.autheticated?(:remember, cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end
  
  # This returns true if the user is logged in, and a false if the user is not
  def logged_in?
    #current user not nil(logged-in)? (true/false)
    !current_user.nil? 
  end
  
  # Returns true if the given user is the current user
  def current_user?(user)
    user == current_user
  end
  
  # Forgets a persistent user
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end  
  
  
  # logs out the current user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  # redirects to the stored location or the default location
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the url trying to be accessed
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end


end