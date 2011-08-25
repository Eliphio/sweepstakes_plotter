class CreateHunches < ActiveRecord::Migration
  def self.up
    create_table :hunches do |t|
      t.references :bet
      t.references :game
      t.integer :team_1_hunch, :default => 0
      t.integer :team_2_hunch, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :hunches
  end
end
