class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.text :record
      t.references :user, index: true

      t.timestamps
    end
  end
end
