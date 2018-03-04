class PostsController < ApplicationController

   # GET /posts
   # GET /ps.json
   
   # before_action :authenticate_user,{only:[:new]}

	def new
		@post = Post.new
	end

	def index
        
		 @posts = Post.search(params[:search])
		
         if @posts.empty?
         	flash[:notice] ="まだデータがないみたい！投稿してみたら？"
           redirect_to("/posts/new")
         end
		
    end

	def recent
		@posts = Post.all.order(created_at: :desc).limit(5)

	end

	def popular
		@comments = Comment.all.order("likes_count desc").limit(5)
	end

	

	def create
		@post=Post.new(content: params[:content],
			user_id: current_user.id,
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
     @comments = Comment.where(post_id: @post.id).order("likes_count desc").limit(3)
    end

end
