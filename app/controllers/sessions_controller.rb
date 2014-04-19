class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if params[:session][:rememberme] == '1'
        sign_in_with_cookie user
      else
        sign_in_with_session user
      end
#      redirect_to user
      redirect_back_or user
    else
      flash[:error] = 'Invalid email/password combination'
      render 'new'
    end

  end

  def destroy
    self.current_user = nil
    cookies.delete(:remember_token)
    session.delete(:user)
    redirect_to root_path
  end
end
