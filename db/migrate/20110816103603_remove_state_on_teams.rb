class RemoveStateOnTeams < ActiveRecord::Migration
  def self.up
    remove_column :teams, :state
  end

  def self.down
    add_column :teams, :state, :integer
  end
end
