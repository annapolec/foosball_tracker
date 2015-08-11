class Match < ActiveRecord::Base
	belongs_to :player1, class_name: "Player", foreign_key: "player1_id"
	belongs_to :player2, class_name: "Player", foreign_key: "player2_id"

	validates :date, :player1_id, :player2_id, :player1_score, :player2_score, presence: true
	validates :player1_score, :player2_score, numericality: { only_integer: true }
	validates_inclusion_of :player1_score, :player2_score, in: 0..10

	validate :there_can_be_one_winner
	validate :player1_has_to_different_than_player2 	

 	private

 	def player1_has_to_different_than_player2
 		errors.add(:player2, 'You have to choose two different players') unless player1 != player2	
 	end 	

 	def there_can_be_one_winner
 		errors.add(:score1, 'There can be only one winner') unless 
 			((player1_score == 10 || player2_score == 10)&&(player1_score+player2_score!=20)) 		
 	end
end
