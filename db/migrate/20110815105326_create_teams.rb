class CreateTeams < ActiveRecord::Migration
  def self.up
    create_table :teams do |t|
      t.string :name
      t.integer :state

      t.timestamps
    end

    add_index :teams, :name
  end

  def self.down
    drop_table :teams
  end
end
