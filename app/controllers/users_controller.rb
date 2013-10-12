class UsersController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
#      render :show

      login_user!
      redirect_to cats_url
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
end
