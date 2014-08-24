class CreateSharedfiles < ActiveRecord::Migration
  def change
    create_table :sharedfiles do |t|
      t.string :title
      t.string :summary
      t.string :category
      t.date :updatetime
      t.string :path

      t.timestamps
    end
  end
end
