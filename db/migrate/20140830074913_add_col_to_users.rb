class AddColToUsers < ActiveRecord::Migration
  def change
    add_column :users, :qq, :string
    add_column :users, :tel, :string
    add_column :users, :sex, :string
    add_column :users, :center, :string
  end
end
