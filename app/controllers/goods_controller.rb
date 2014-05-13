class GoodsController < ApplicationController
  before_filter :signed_in_user



  def index
    @goods = Good.all.select(:id, :提单号, :品牌, :商品条码, :商品名称, :单价, :数量)

  #  respond_to do |format|
  #    format.html
  #    format.json {render json: @goods}
  #  end
  end




end
