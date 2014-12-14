class SessionsController < ApplicationController
  def new
  end

  def create
    name_or_email = params[:session][:name].downcase
    user = User.find_by(email: name_or_email) || User.find_by(name: name_or_email)
    if user && user.authenticate(params[:session][:password])
  #  	sign_in_with_status user, (params[:session][:rememberme] == '1')
			log_in user
    	flash[:info] = t "user.controller.login_success"
			redirect_to user
    else
      flash.now[:danger] = t "user.controller.wrong_username_or_password"
      render 'new'
    end
  end

  def destroy

  end
end
