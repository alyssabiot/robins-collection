class CreateFigurineSpecialities < ActiveRecord::Migration[6.1]
  def change
    create_table :figurine_specialities do |t|
      t.references :figurine, foreign_key: true
      t.references :speciality, foreign_key: true

      t.timestamps
    end
  end
end
