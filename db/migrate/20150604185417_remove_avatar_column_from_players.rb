class RemoveAvatarColumnFromPlayers < ActiveRecord::Migration
  def up
  	remove_column :players, :avatar, :string
  end

  def down
  	add_column :players, :avatar, :string
  end
end
