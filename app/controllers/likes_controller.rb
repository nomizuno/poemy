class LikesController < ApplicationController
	

	def create
		@like = Like.new(
			user_id: @current_user.id,
			comment_id: params[:comment_id]
			)
		@like.save
		@comment = Comment.find_by(id: params[:comment_id])
		@post = Post.find_by(id: @comment.post_id)
		redirect_to("/posts/#{@post.id}")
	end
	
	def destroy
		@like = Like.find_by(
			user_id: @current_user.id,
			comment_id: params[:comment_id]
			)
		@like.destroy
		@comment = Comment.find_by(id: params[:comment_id])
		@post = Post.find_by(id: @comment.post_id)
		redirect_to("/posts/#{@post.id}")
	end

end
