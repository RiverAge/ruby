class InfoManagesController < ApplicationController
 before_filter :signed_in_user
  def index
  @users = User.all;

  end
end
