class SessionsController < ApplicationController
  def new
#    @session = Session.new
    render :new
  end

  def create
#    @user = User.find_by_session_token()
    @user = User.find_by_credentials(params[:user][:user_name],
                                     params[:user][:password])

    @user.reset_session_token!
    login_user!

    if @user.nil?
      redirect_to users_url
    else
      current_user = @user
      redirect_to cats_url
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

end
