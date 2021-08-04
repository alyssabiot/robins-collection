class DeleteHasArtistFromFigurines < ActiveRecord::Migration[6.1]
  def change
    remove_column :figurines, :has_artist
  end
end
