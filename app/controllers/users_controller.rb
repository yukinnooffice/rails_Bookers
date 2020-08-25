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
      redirect_to user_path(current_user), alert: "error"
    end
  end

  def update
  	@user = User.find(params[:id])
    if  @user.update(user_params)
        flash[:notice] = "User was successfully updated."
        redirect_to user_path(@user)
    else
      render :edit
    end
  end




  private
  def user_params
    params.require(:user).permit(:name, :email, :introduction, :profile_image)
  end
end
