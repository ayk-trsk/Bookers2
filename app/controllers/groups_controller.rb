class GroupsController < ApplicationController
  def index
    @book = Book.new
    @groups = Group.all
    @user = current_user
  end

  def show
    @book = Book.new
    @user = current_user
    @group = Group.find(params[:id])
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
    if @group.owner_id == current_user.id
      render 'edit'
    else
      redirect_to groups_path
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      flash[:motice] = "You have updated group successfully."
      redirect_to groups_path
    else
      render :edit
    end

  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :image )
  end
end
