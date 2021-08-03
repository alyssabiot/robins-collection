class AddFamilyRefToFigurines < ActiveRecord::Migration[6.1]
  def change
    add_reference :figurines, :family, foreign_key: false
  end
end
