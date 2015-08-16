class Comment < ActiveRecord::Base
	belongs_to :match
	belongs_to :player
  default_scope -> { order(created_at: :desc) }
  validates :player_id, :match_id, presence: true
  validates :content, presence: true, length: { maximum: 300 }
end
