class SessionsController < ApplicationController
  def new
    if logged_in?
      redirect_to shared_files_path
    end
  end

  def create
    name_or_email = params[:session][:name].downcase
    user = User.find_by(email: name_or_email) || User.find_by(name: name_or_email)
    if user && user.authenticate(params[:session][:password])
  #  sign_in_with_status user, (params[:session][:rememberme] == '1')
      log_in user
      params[:session][:rememberme] == '1' ? remember(user) : forget(user)
      flash[:info] = t "user.controller.login_success"
      redirect_to user
    else
      flash.now[:danger] = t "user.controller.wrong_username_or_password"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
