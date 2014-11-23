module UsersHelper
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)

  end

  def sign_in_with_status(user, status)
    if status
      cookies.permanent[:remember_token] = user.remember_token
    else
      session[:remember_token] = user.remember_token
    end      
    self.current_user = user
  end

#  def sign_in_with_session(user)
#    session[:remember_token] = user.remember_token
#    self.current_user = user
#  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user?(user)
    user == current_user
  end

  def current_user
    @current_user = @current_user || User.find_by_remember_token(session[:remember_token]) || User.find_by_remember_token(cookies[:remember_token])
  end

  def redirect_back_or(default)
    redirect_to (session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.fullpath
  end

  def signed_in_user
    if (!signed_in?)
      store_location
      redirect_to login_path
    end
  end

  def correct_user
    @user = User.find(params[:id])
    if (!current_user?(@user))
      redirect_to root_path
    end
  end

end
