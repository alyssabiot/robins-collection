class AddArtistRefToFigurine < ActiveRecord::Migration[6.1]
  def change
    add_reference :figurines, :artist, foreign_key: false
  end
end
