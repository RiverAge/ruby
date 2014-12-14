class SessionsController < ApplicationController
	def new
	end

	def create
    name_or_email = params[:user][:name].downcase
		user = User.find_by(email: name_or_email) || User.find_by(name: name_or_email)
		if user && user.authenticate(params[:user][:password])
			sign_in_with_status user, (params[:user][:rememberme] == '1')
			flash[:info] = t "user.controller.login_success"
			#     redirect_back_or shared_files_path
		else
			flash.now[:danger] = t "user.controller.wrong_username_or_password"
			render 'new'
		end
	end

	def destroy

	end
end
