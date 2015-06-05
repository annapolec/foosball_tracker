class Match < ActiveRecord::Base
	belongs_to :player1, class_name: "Player", foreign_key: "player1_id"
	belongs_to :player2, class_name: "Player", foreign_key: "player2_id"

	validates :date, :player1_id, :player2_id, :player1_score, :player2_score, presence: true
	validates :player1_score, :player2_score, numericality: { only_integer: true }
	validates_inclusion_of :player1_score, :player2_score, in: 0..10

end
