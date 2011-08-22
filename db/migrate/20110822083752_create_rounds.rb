class CreateRounds < ActiveRecord::Migration
  def self.up
    create_table :rounds do |t|
      t.references :championship
      t.string :name

      t.timestamps
    end
    add_index :rounds, :championship_id
    add_index :rounds, :name
  end

  def self.down
    drop_table :rounds
  end
end
