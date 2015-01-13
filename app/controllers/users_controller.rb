class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id.to_s
      redirect_to users_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      #params.require(:user).permit(:firstname, :lastname, :email, :address, :city, :state, :zip, :password)
      redirect_to @user
    else
      render "edit"
    end
  end

  def destroy
    @user = User.find(params[:id])
    if(params[:id] == session[:user_id])
      session.delete(:user_id)
    end
    @user.destroy
    redirect_to users_path
  end

  def calendar
    @time = Time.now
  end

  private
  def user_params
    params.require(:user).permit(:firstname, :lastname, :email, :address, :city, :state, :zip, :password, :password_confirmation, :image)
  end

end
