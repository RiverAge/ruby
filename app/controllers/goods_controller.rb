class GoodsController < ApplicationController
  before_filter :signed_in_user

  def searchContainer
    @containers = Container.all.select(:id, :状态, :提单号, :箱数, :负责人, :入库提交时间, :出库状态)
  end

  def searchGoods
    @goods = Good.all.select(:id, :提单号, :品牌, :商品条码, :商品名称, :单价, :数量)
  end

  def searchSpecialGoods
    @specialGoods = SpecialGood.all.select(:id, :条码, :品牌, :规格型号, :数量, :特殊处理原因, :存放区域)
  end


end
