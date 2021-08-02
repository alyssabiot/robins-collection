class RenameUserToArtist < ActiveRecord::Migration[6.1]
  def change
    rename_table :users, :artists
  end
end
