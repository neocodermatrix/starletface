class PostsController < ApplicationController
  def index
  	#@posts = Post.all
    @user = User.find(params[:user_id])
    @posts = @user.posts
    #Error when @posts was before @user.  Switching them @user post, now user is defined for @post=@user.posts
  end

  def show
    @user = User.find(params[:user_id])
    # @posts = @user.posts
    @post = Post.find(params[:id])
  	# @post = Post.find(params[:id])
  	@comment = Comment.new
  end

  def new
    @user = User.find(params[:user_id])
    #comparing logged in user with current user
    if logged_in? && @user == current_user
      @post = Post.new
    else
      redirect_to users_path
    end
  	
    # @user = current_user
    

  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.new(post_params)
  	# @post = Post.create(post_params)
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
