# encoding: UTF-8
class CreateDuties < ActiveRecord::Migration
  def change
    create_table :duties do |t|

      t.timestamps
    end
  end
end
