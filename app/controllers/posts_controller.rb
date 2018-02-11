class PostsController < ApplicationController

	def new
		@post = Post.new
	end

	def index
		@posts = Post.all.order(created_at: :desc)

	end

def create
  	@post=Post.new(content: params[:content],
                    user_id: @current_user.id)
    @post.save
  if @post.save
      #保存できた場合
      redirect_to("/posts/index")
      flash[:notice] ="投稿できたよ"
    else
      render("/posts/new")
    end
  end

end
