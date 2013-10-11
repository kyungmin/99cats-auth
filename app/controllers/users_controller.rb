class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      render :show
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
end
