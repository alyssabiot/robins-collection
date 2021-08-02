class AddUniverseRefToFigurines < ActiveRecord::Migration[6.1]
  def change
    add_reference :figurines, :universe, foreign_key: false
  end
end
