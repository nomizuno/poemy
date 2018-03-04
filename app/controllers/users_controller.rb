class UsersController < ApplicationController


  before_action :authenticate_user,{only:[:edit, :update]}
  before_action :forbid_login_user,{only:[:login, :new, :create, :login, :login_form]}
  before_action :ensure_current_user,{only:[:edit, :update]}
  
  def ensure_current_user
    if current_user.id != params[:id].to_i
      flash[:notice] = "入れないみたい"
      redirect_to("/posts/index")
    end
  end

  def show
  	@user = User.find_by(id: params[:id])
    if @user.image_name == nil
      @user.image_name = "default_user.jpg"
      @user.save
    end


    if @user.username == nil
      @user.username = "名無し"
      @user.save
    end

    @comments = Comment.where(user_id: @user.id)
    @post_count = Post.where(user_id: @user.id).count
    @comments_count = Comment.where(user_id: @user.id).count

  end

  def new
   @user = User.new
   
 end

 

def edit
 @user = User.find_by(id: params[:id])
 @user.save
end

def update
 @user = User.find_by(id: params[:id])
 @user.username = params[:name]

 if params[:image]
  @user.image_name = "#{@user.id}.jpg"
  image = params[:image]
  File.binwrite("public/user_images/#{@user.image_name}",image.read)
 end

if @user.save
 redirect_to("/users/#{@user.id}")
 flash[:notice] ="保存できたよ！"
else
 render("/users/edit")
end
end




def likes
  @user = User.find_by(id: params[:id])
  @likes = Like.where(user_id: @user.id)
end


end
