class AddColumnsToMatches < ActiveRecord::Migration
  def change
  	add_column :matches, :player1_id, :integer
  	add_column :matches, :player2_id, :integer
  	add_column :matches, :player1_score, :integer
  	add_column :matches, :player2_score, :integer
  end
end
