class SpecialgoodsController < ApplicationController
  def index
    @specialGoods = SpecialGood.all.select(:id, :条码, :品牌, :规格型号, :数量, :特殊处理原因, :存放区域)
  end
end
