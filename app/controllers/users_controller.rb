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
    if @user.save
      redirect_to users_path
    else
      render :new
    end
  end

  private

  def users_params
    params.require(:user).permit(:name,:profile_image)
  end
end
