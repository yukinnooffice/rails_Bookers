class UsersController < ApplicationController
  def index
    @book = Book.new
  	@users = User.all
  end

  def show
    @book = Book.new
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
  end

  def update
  	@user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :introduction, :profile_image)
  end
end
