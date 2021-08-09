class RemoveSpecialityFromFigurines < ActiveRecord::Migration[6.1]
  def change
    remove_reference :figurines, :speciality, foreign_key: false
  end
end
