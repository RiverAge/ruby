class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:login_error] = nil
      if params[:session][:rememberme] == '1'
        sign_in_with_cookie user
      else
        sign_in_with_session user
      end
      redirect_back_or user
    else
      session[:login_error] = '1'

      render 'new'
    end

  end

  def destroy
    self.current_user = nil
    cookies.delete(:remember_token)
    session[:remember_token] = nil
    session.delete(:user)
    redirect_to root_path
  end
end
