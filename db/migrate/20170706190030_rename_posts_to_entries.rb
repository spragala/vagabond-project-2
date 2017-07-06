class RenamePostsToEntries < ActiveRecord::Migration[5.1]
  def change
    rename_table :posts, :entries
  end
end
