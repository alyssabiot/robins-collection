class AddBooleanFieldsToFigurines < ActiveRecord::Migration[6.1]
  def change
    add_column :figurines, :is_painted, :boolean, default: false
    add_column :figurines, :has_artist, :boolean, default: false
    add_column :figurines, :has_portrait, :boolean, default: false
  end
end
