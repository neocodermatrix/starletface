class CommentsController < ApplicationController

	def create
		#user = User.find(params[:user_id])
		post = Post.find(params[:post_id])
		#retrieving one specific post id object from database.
		comment = post.comments.create(comment_params)
		#we are writing data from comment to the post with the comment data retrieved from comment_params
		redirect_to user_post_path(post.user, post)
		#after the above two lines are done, the user is redirected to user_post page which is the same page and according to rake routes, in order to go to that page, rake routes said it needs two ids user:id and post:id.  Without these two ids being passed into user_post, the user won't be redirected to the same page.
	end

	private
	def comment_params
		params.require(:comment).permit(:body)
		#Looking at the data in the server (terminal rails s), when the user clicks the Add A Comment button, a POST http verb request is sent from the browser to the rails server.  It's passing the parameter object which in it has many hashes.  One has has the comment as a key and this key has a hash as a value.  The value is :body which contains the data the user typed up.  Yes, whatever the user typed is stored in the :body value of the :comment hash.  
	end


end
