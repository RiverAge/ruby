class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :edit, :update]
  before_filter :correct_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def index
    @users = User.all
    #  @users = User.paginate(page:3)
    #  @users = User.all.page(params[:page]).per(3)
  end

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @user }
    end
  end

  def create

    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      sign_in_with_session @user
       redirect_to @shared_files_path
    else
      render 'new'
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:email, :password, :password_confirmation))
      #用户更新之后，由于remember_token的也随之更新了，所以用之前保存的remeber_token就找不到该用户了
      sign_in_with_status @user, @login_status
      redirect_to shared_files_path
    else
      render 'edit'
    end
  end

  def login
      redirect_to shared_files_path if (!self.current_user.nil?)
  end

  def logout
    clear_session
  end

  def login_create_session
    user = User.find_by(email: params[:user][:name].downcase) || User.find_by(name: params[:user][:name])
    if user && user.authenticate(params[:user][:password])

      if params[:user][:rememberme] == '1'
        @login_status = true
      else
        @loin_status = false
      end

      sign_in_with_status user, @login_status
      redirect_back_or shared_files_path
      #redirect_to shared_files_path, notice: (t "user.controller.login_success")
    else
      flash[:login_error] = '1'

      render 'login'
    end
  end

  def destroy
    clear_session
  end

  private
  def clear_session
    self.current_user = nil
    cookies.delete(:remember_token)
    session[:remember_token] = nil
    redirect_to login_path
  end

end
