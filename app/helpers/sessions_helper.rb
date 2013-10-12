module SessionsHelper

  def current_user
    @current_user = User.find_by_session_token(session[:session_token])
  end

  def login_user!
    session[:session_token] = @user.session_token
  end
end
