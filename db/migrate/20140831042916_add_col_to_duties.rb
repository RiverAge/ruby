class AddColToDuties < ActiveRecord::Migration
  def change
    add_column :duties, :date, :date
    add_column :duties, :user_id, :integer
    add_column :duties, :duty, :string
  end
end
