# encoding: UTF-8
class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|

      t.string	:报关单项数
      t.string	:提单号
      t.string	:箱号
      t.string	:发票号
      t.string	:发票序号
      t.string	:品牌
      t.string	:商品代码
      t.string	:商品条码
      t.string	:SKU_DESCRIPTION
      t.string	:商品名称
      t.string	:规格型号
      t.string	:单价
      t.string	:数量
      t.string	:净重
      t.string	:金额
      t.string	:生产日期
      t.string	:限期使用日期
      t.string	:原产地
      t.string	:出货类型
      t.string	:备注
      t.string	:库存区域
      t.string	:库存
      t.string	:负责人
      t.string	:一号周转仓库存
      t.string	:一号周转仓区域
      t.string	:二号周转仓库存
      t.string	:二号周转仓区域

      t.timestamps
    end
  end
end
