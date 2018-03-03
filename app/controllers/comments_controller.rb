class CommentsController < ApplicationController


	def create
		@comment=Comment.new(content: params[:content],
			user_id: current_user.id,
			post_id: params[:id])
		@comment.save
		if @comment.save
           #保存できた場合
           redirect_to("/posts/#{@comment.post_id}")
           flash[:notice] ="投稿できたよ!"
       else
  	        redirect_to("/posts/#{params[:id]}")
        end
     end


    def destroy
      @comment =Comment.find_by(id: params[:id])
     
      @post = Post.find_by(id: @comment.post_id)
      @comment.destroy
      flash[:notice]="消えちゃった、、、"
      redirect_to("/posts/#{@post.id}")
     end
 
end
