module SessionsHelper
  def sign_in_with_cookie(user)
    cookies.permanent[:remember_token] = user.remember_token
    self.current_user = user
  end

  def sign_in_with_session(user)
    session[:user] = user
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    @current_user = @current_user || session[:user] || User.find_by_remember_token(cookies[:remember_token])
  end
end
