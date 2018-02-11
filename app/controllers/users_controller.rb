class UsersController < ApplicationController
  def show
  	@user = User.find_by(id: params[:id])
  end

  def new
     @user = User.new
  end

  def create
  	@user =User.new(name: params[:name], 
                    email: params[:email],
                    password: params[:password],
                    image_name: "default_user.jpg"
                    )
  
  	if @user.save
      session[:user_id]=@user.id
    	redirect_to("/users/#{@user.id}")
    	 flash[:notice] ="登録できたよ"
    else
    	render("/users/new")
    end
  end

end
