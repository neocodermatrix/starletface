class SessionsController < ApplicationController
  
  def new
  end
  
  def create
  	user = User.where(email: params[:login][:email]).first
  	if user && user.authenticate(params[:login][:password])
        session[:user_id] = user.id.to_s
      	redirect_to user_path(user)
        #user retrieves from the database all the users with a specific user and email address provided by the user.
    else
      	redirect_to login_path
    end
  end
  
  def destroy
  	session.delete(:user_id)
    redirect_to login_path
  end
end
