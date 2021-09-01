class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(users_params)
    @user.profile_image.attach(params[:user][:profile_image])
    respond_to do |format|
      if @user.save
         format.html { redirect_to users_path }
         format.js
      else
         format.html { render :new }
      end
    end 
  end
  
  def image_update
    @user = User.find(current_user.id)
    respond_to do |format|
      if @user.update(users_params)
         format.html { redirect_to @user }
         format.js 
      end
    end
  end

  def show 
    @user = User.friendly.find(params[:id])
  end

  private

  def users_params
    params.require(:user).permit(:user_image)
  end
end
