class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.references :figurine, foreign_key: true
      t.references :game, foreign_key: true
      t.string :player

      t.timestamps
    end
  end
end
