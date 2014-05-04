# encoding: UTF-8
class CreateLaunches < ActiveRecord::Migration
  def change
    create_table :launches do |t|

      t.string	:提单号
      t.string	:商品代码
      t.string	:商品名称
      t.string	:出货类型
      t.string	:出货时间
      t.string	:出货数量

      t.timestamps
    end
  end
end
