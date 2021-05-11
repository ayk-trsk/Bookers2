class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
    @books = Book.all
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
