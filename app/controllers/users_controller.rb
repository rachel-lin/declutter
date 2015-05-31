class UsersController < ApplicationController
  def index
    @user = User.find(params[:id])
    @items = @user.items
  end

  def show
    @user = User.find(params[:id])
    @items = @user.items
  end
end
