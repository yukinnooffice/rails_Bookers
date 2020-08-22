class UsersController < ApplicationController
  def index

  	@users = User.all

  end

  def show
  	@user = User.find(params[:id])
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :introduction, :profile_image)
  end
end
