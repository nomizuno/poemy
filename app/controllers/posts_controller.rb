class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def index
		@posts = Post.all.order(created_at: :desc)

	end
end
