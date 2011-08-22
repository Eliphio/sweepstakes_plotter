class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.references :round
      t.references :team_1
      t.references :team_2
      t.date :game_day
      t.time :game_time

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
