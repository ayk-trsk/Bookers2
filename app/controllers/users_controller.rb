class UsersController < ApplicationController
  def edit
    @user = User.find(params[])
  end

end
