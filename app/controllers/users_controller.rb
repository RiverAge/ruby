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
      format.json { render json: @user}
    end
  end

  def create

    @user = User.new(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    if @user.save
      sign_in_with_session @user
      redirect_to @user
    else
      render 'new'
    end

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params.require(:user).permit(:name, :email, :password, :password_confirmation))
    else
      render 'edit'
    end
  end

  def login

  end

  def logout
    self.current_user = nil
    cookies.delete(:remember_token)
    session[:remember_token] = nil
    session.delete(:user)
    redirect_to login_path
  end

  def login_create_session
    user = User.find_by(email: params[:user][:email].downcase)
    if user && user.authenticate(params[:user][:password])
      flash[:login_error] = nil
      if params[:user][:rememberme] == '1'
        sign_in_with_cookie user
      else
        sign_in_with_session user
      end
      redirect_back_or user
    else
      flash[:login_error] = '1'

      render 'login'
    end
  end

  def destroy
    self.current_user = nil
    cookies.delete(:remember_token)
    session[:remember_token] = nil
    redirect_to login_path
  end


end
