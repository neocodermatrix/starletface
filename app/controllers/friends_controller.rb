class FriendsController < ApplicationController
  def index
    @friends = Friend.all
  end

  def new
    @friend = Friend.new
  end

  def create
    @friend = Friend.create(friend_params)
    if @friend.save
      redirect_to friends_path
    else
      render :new
    end
  end

  def show
    @friend = Friend.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def friend_params
    params.require(:friend).permit(:firstname, :lastname, :email, :address, :city, :state, :zip, :password)
  end

end
