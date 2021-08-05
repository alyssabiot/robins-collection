class RenameDateFromGames < ActiveRecord::Migration[6.1]
  def change
    rename_column :games, :date, :game_date
  end
end
