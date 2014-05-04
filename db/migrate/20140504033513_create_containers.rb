# encoding: UTF-8
class CreateContainers < ActiveRecord::Migration
  def change
    create_table :containers do |t|

      t.string	:状态
      t.string	:提单号
      t.string	:到港日期
      t.string	:市场部确认时间
      t.string	:货值
      t.string	:品类
      t.string	:单品数量
      t.string	:需货检单品数量
      t.string	:法检类型
      t.string	:当前报检进度
      t.string	:提样日期
      t.string	:标签制作日期
      t.string	:CIQ报检交单日期
      t.string	:CIQ初审日期
      t.string	:初审错误数量
      t.string	:报检单改单日期
      t.string	:CIQ复审日期
      t.string	:换单时间
      t.string	:抽样日期
      t.string	:CIQ放行日期
      t.string	:报检备注
      t.string	:当前报关进度
      t.string	:报关交单日期
      t.string	:出关封日期
      t.string	:仓库通知改单日期
      t.string	:改单完毕日期
      t.string	:报关备注
      t.string	:通关用时
      t.string	:理货进度
      t.string	:提货日期
      t.string	:箱数
      t.string	:开始理货时间
      t.string	:理货完毕时间
      t.string	:理货单据制作完成时间
      t.string	:送单时间
      t.string	:理货负责人
      t.string	:出货状态
      t.string	:理货中心用时
      t.string	:理货备注
      t.string	:接单时间
      t.string	:负责人
      t.string	:基础信息录入开始时间
      t.string	:基础信息录入状态
      t.string	:入库状态
      t.string	:入库提交时间
      t.string	:海关入库完成时间
      t.string	:入库天数
      t.string	:出库状态
      t.string	:出库完成时间
      t.string	:出库天数
      t.string	:出库提交时间
      t.string	:信息录入备注
      t.string	:完成天数

      t.timestamps
    end
  end
end
