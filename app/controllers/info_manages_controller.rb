class InfoManagesController < ApplicationController
 before_filter :signed_in_user
  def index
  @users = User.all;

  end

  def get_duty
    @duty = User.find(params[:id]).duties.where("date like ?", params[:month] + "%");
    # @duty = "a"

    respond_to do |format|
      format.html
      format.js
      puts @duty.inspect
    end
  end
end
