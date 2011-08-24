class CreateBets < ActiveRecord::Migration
  def self.up
    create_table :bets do |t|
      t.references :round
      t.references :user
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :bets
  end
end
