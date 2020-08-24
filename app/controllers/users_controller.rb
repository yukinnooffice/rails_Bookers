class UsersController < ApplicationController
before_action :authenticate_user!
  def index
    @book = Book.new
  	@users = User.all
    @user = current_user
  end

  def show
    @book = Book.new
  	@user = User.find(params[:id])
  end

  def edit
  	@user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user), alert: "不正なアクセスです。"
    end
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
