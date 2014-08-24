class RemoveupdatetimeFromSharedfiles < ActiveRecord::Migration
  def change
    remove_column :sharedfiles, :updatetime, :date
  end
end
