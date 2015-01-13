module SessionsHelper
  def current_user
  	if(session[:user_id])
    # use what's stored in our session
    # to find which user we are
    @current_user ||= User.find(session[:user_id])
	  end
  end

  def logged_in?
  	session[:user_id] != nil
    #if session user id not equal to nil means there is a user is signed.
  end
  

end