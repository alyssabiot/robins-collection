class AddDateToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :date, :datetime
  end
end
