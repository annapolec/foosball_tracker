class RemoveAvatarFromPlayers < ActiveRecord::Migration
  def up
    remove_column :players, :avatar_file_name
    remove_column :players, :avatar_content_type
    remove_column :players, :avatar_file_size
    remove_column :players, :avatar_updated_at
  end

  def down
    add_column :players, :avatar_file_name, :string
    add_column :players, :avatar_content_type, :string
    add_column :players, :avatar_file_size, :integer
    add_column :players, :avatar_updated_at, :datetime
  end
end
