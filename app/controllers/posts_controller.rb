class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def index
		@posts = Post.all.order(reading: :asc)

	end

	def recent
		@posts = Post.all.order(created_at: :desc)

	end

	def popular

     @comments = Comment.all.order(likes_count: :desc)

	end

	def create
		@post=Post.new(content: params[:content],
			user_id: @current_user.id,
			reading: params[:reading])
		@post.save
	  if @post.save
      #保存できた場合
        redirect_to("/posts/index")
        flash[:notice] ="投稿できたよ!"
      else
  	    render("/posts/new")
      end
    end


    def show
     @post = Post.find_by(id: params[:id])
     @comments = Comment.where(post_id: @post.id).order("likes_count desc")
    end

end
