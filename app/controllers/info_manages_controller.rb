class InfoManagesController < ApplicationController
 before_filter :signed_in_user
  def index
  @users = User.all;

  end

  def get_duty
    @duty = User.find(params[:id]).duties.where("date >= ? and date < ?", params[:month]+"01", (params[:month]+"01").to_date.next_month.to_s);
    # @duty = "a"

    respond_to do |format|
      format.html
      format.js
      puts @duty.inspect
    end
  end
end
