class AddSpecialityRefToFigurines < ActiveRecord::Migration[6.1]
  def change
    add_reference :figurines, :speciality, foreign_key: false
  end
end
