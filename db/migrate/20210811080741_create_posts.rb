class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :player_id, null: false
      t.integer :high_school_id, null: false
      t.string :title, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
