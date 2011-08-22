class CreateChampionships < ActiveRecord::Migration
  def self.up
    create_table :championships do |t|
      t.string :name
      t.date :started_on
      t.date :ended_on

      t.timestamps
    end

    add_index :championships, :name
  end

  def self.down
    drop_table :championships
  end
end
