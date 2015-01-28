class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])

    @comment = Comment.new
  end

  def new
    @user = User.find(params[:user_id])
    if logged_in? && @user == current_user
      @post = Post.new
    else
      redirect_to users_path
    end
    
    

  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
  	if @post.save
  		redirect_to user_posts_path
  	else
  		render :new
  	end

  end

  private
  def post_params
  	params.require(:post).permit(:title, :body)
  end
end
