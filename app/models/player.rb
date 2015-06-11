class Player < ActiveRecord::Base
	
	has_attached_file :avatar, :styles => { medium: "300x300>", thumb: "100x100>" }, 
											default_url: "/images/:style/missing.png"

	validates :first_name, :last_name, presence: true
	validates :avatar, attachment_presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: %r{\.(gif|jpg|png)\Z}i

  
  def number_of_matches
		Match.where(player1: self).count +
		Match.where(player2: self).count
	end

  def total_score
  	Match.where(player1: self).sum(:player1_score)+
	 	Match.where(player2: self).sum(:player2_score)
	end

	def wins		
		Match.where(player1: self, player1_score: 10).count + 			
		Match.where(player2: self, player2_score: 10).count
	end

	def losts
		Match.where(player1: self).where.not(player1_score: 10).count + 			
		Match.where(player2: self).where.not(player2_score: 10).count		
	end

	def medium_wins
		Match.where(player1: self, player1_score: 7..9).count + 			
		Match.where(player2: self, player2_score: 7..9).count
	end

	def points
		#winning gives you 3 points
		#losing with 7 or more goals gives you 1 point
		3*wins+medium_wins
	end

	def average_number_of_goals
		total_score/number_of_matches
	end

end
