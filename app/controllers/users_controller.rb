class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :edit, :update]
  before_filter :correct_user, only: [:show, :edit, :update]

  def new
    @user = User.new
    @errors = @user.errors
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
      flash[:info] = t "user.controller.create_success"
      redirect_to @shared_files_path
    else
      @errors = @user.errors
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
    @errors = @user.errors
  end

  def update
    @user = User.find(params[:id])
    remember_flg = remember_me_next_time(@user)
    if @user.update_attributes(params.require(:user).permit(:email, :password, :password_confirmation))
      #用户更新之后，由于remember_token的也随之更新了，所以用之前保存的remeber_token就找不到该用户了
      sign_in_with_status @user, remember_flg
      flash[:info] = t "user.controller.update_success"
      redirect_to shared_files_path
    else
      @errors = @user.errors
      render 'edit'
    end
  end

  def login
      redirect_to shared_files_path if (!self.current_user.nil?)
  end

  def logout
    clear_session
  end

  # def login_create_session
  #   user = User.find_by(email: params[:user][:name].downcase) || User.find_by(name: params[:user][:name])
  #   if user && user.authenticate(params[:user][:password])
  #     sign_in_with_status user, (params[:user][:rememberme] == '1')
  #     flash[:info] = t "user.controller.login_success"
  #     redirect_back_or shared_files_path
  #   else
  #     flash.now[:danger] = t "user.controller.wrong_username_or_password"
  #     render 'login'
  #   end
  # end

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
