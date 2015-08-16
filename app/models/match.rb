class Match < ActiveRecord::Base
	belongs_to :player1, class_name: "Player", foreign_key: "player1_id"
	belongs_to :player2, class_name: "Player", foreign_key: "player2_id"
	has_many :comments, dependent: :destroy

	validates :date, :player1_id, :player2_id, :player1_score, :player2_score, presence: true
	validates :player1_score, :player2_score, numericality: { only_integer: true }
	validates_inclusion_of :player1_score, :player2_score, in: 0..10
	validates_date :date, :before => lambda { Date.tomorrow }

	validate :there_should_be_one_winner
	validate :player1_has_to_be_different_than_player2 	

	def difference_in_goals_index
		difference_in_goals = (player1_score - player2_score).abs
		case difference_in_goals
			when 1
			  return 10
			when 2
			  return 15
			else
			  return (11+difference_in_goals)/0.8
		end
	end

	def difference_in_players_points
		(player1.points-player2.points).abs
	end

	def winning_probability_for(player)
		if player == expected_winner
			1/(10**(-(difference_in_players_points/40.0))+1)
		else
			1-1/(10**(-(difference_in_players_points/40.0))+1)
		end
	end

	def result_for(player)
	 player == actual_winner ? 1 : 0
	end

	def expected_winner
	 player1.points > player2.points ? player1 : player2		
	end

	def actual_winner
		player1_score == 10 ? player1 : player2
	end

	def add_points_to_players
		gained_points = difference_in_goals_index*(result_for(player1) - winning_probability_for(player1))
		player1.update_attribute(:points, player1.points+gained_points)
		gained_points = difference_in_goals_index*(result_for(player2) - winning_probability_for(player2))
		player2.update_attribute(:points, player2.points+gained_points)
	end

	private

	def player1_has_to_be_different_than_player2
 		errors.add(:player2, 'You have to choose two different players') unless player1_id != player2_id
 	end 	

 	def there_should_be_one_winner
 		errors.add(:score1, 'There should be one winner') unless 
 			((player1_score == 10 || player2_score == 10)&&(player1_score+player2_score!=20)) 		
 	end
end
