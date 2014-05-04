# encoding: UTF-8
class CreateSpecialGoods < ActiveRecord::Migration
  def change
    create_table :special_goods do |t|

      t.string	:条码
      t.string	:品牌
      t.string	:商品名称
      t.string	:规格型号
      t.string	:数量
      t.float	:零售价格
      t.float	:最后进价
      t.float	:进货金额
      t.string	:特殊处理原因
      t.string	:原因明细
      t.string	:供货商
      t.string	:存放区域
      t.string	:备注
      t.string	:处理方法

      t.timestamps
    end
  end
end
