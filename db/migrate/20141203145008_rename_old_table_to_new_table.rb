class RenameOldTableToNewTable < ActiveRecord::Migration

  def change
    rename_table :sharedfiles, :shared_files
  end
end
