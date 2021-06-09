class UsersController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @today_book = @books.created_today
    @yesterday_book = @books.created_yesterday
    @this_week_book = @books.created_this_week
    @last_week_book = @books.created_last_week
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def following
      @user  = User.find(params[:id])
      @users = @user.following_user
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.follower_user
    render 'show_follower'
  end

  def date_search
    @user = User.find(params[:user_id])
    @books = @user.books
    @book = Book.new
    create_at = params[:created_at]
    @date_search_book = @books.where('created_at LIKE ?', "#{create_at}%").count
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
