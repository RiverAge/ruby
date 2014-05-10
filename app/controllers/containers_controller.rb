class ContainersController < ApplicationController
  def index
    @containers = Container.all.select(:id, :状态, :提单号, :箱数, :负责人, :入库提交时间, :出库状态)
  end
end
