class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.integer :player_id
      t.integer :school_id
      t.integer :room_id
      t.string :content, null: false
      t.timestamps
    end
  end
end
