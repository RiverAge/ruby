class InfoManagesController < ApplicationController
 before_filter :signed_in_user
  def index
  @users = User.all
  end

  def get_duty
    this_month = params[:month]+"01";
    next_month = (params[:month]+"01").to_date.next_month.strftime("%Y%m%d")
    #数据库时间做比较时，如果年月日直接按有“-”可能会造成比较异常
    @duty = User.find(params[:id]).duties.where("date >= ? and date < ?",this_month, next_month);
    p @duty.inspect
    respond_to do |format|
      format.html {}
      format.js {}
      format.json {render :json => @duty}
    end
  end
end
