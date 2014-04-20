class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :show, :edit, :update]
  before_filter :correct_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
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

  private
    def signed_in_user
      if(!signed_in?)
        store_location
        redirect_to signin_path
      end
    end

    def correct_user
      @user = User.find(params[:id])
      if (!current_user?(@user))
        redirect_to root_path
      end
    end

end
