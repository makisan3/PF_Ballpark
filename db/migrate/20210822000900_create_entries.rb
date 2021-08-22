class CreateEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :entries do |t|
      t.integer :player_id
      t.integer :school_id
      t.integer :room_id
      t.timestamps
    end
  end
end
