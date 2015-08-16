class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text :content
      t.references :player, index: true, foreign_key: true
      t.references :match, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :comments, [:player_id, :created_at]
    add_index :comments, [:match_id, :created_at]
  end
end

