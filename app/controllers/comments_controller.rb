class CommentsController < ApplicationController


	def create
		@comment=Comment.new(content: params[:content],
			user_id: @current_user.id,
			post_id: params[:id])
		@comment.save
		if @comment.save
      #保存できた場合
      redirect_to("/posts/index")
      flash[:notice] ="投稿できたよ"
  else
  	render("/posts/index")
  end
end

end
