class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.integer :player_id
      t.integer :match_id
      t.integer :score	
      t.timestamps
    end
  end
end
