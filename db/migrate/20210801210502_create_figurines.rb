class CreateFigurines < ActiveRecord::Migration[6.1]
  def change
    create_table :figurines do |t|
      t.string :name
      t.text :comment

      t.timestamps
    end
  end
end
