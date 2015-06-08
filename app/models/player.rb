class Player < ActiveRecord::Base
	
	
	has_attached_file :avatar, :styles => { medium: "300x300>", thumb: "100x100>" }, 
											default_url: "/images/:style/missing.png"

	validates :first_name, :last_name, presence: true
	validates :avatar, attachment_presence: true
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates_attachment_file_name :avatar, matches: %r{\.(gif|jpg|png)\Z}i

  def total_score
  	Match.where(player1: self).sum(:player1_score)+
	 	Match.where(player2: self).sum(:player2_score)
	end

	def wins		
		number_of_wins = 0
		Match.where(player1: self).each do |match|
			if match.player1_score == 10
				number_of_wins += 1
			end
		end
		Match.where(player2: self).each do |match|
			if match.player2_score == 10
				number_of_wins += 1
			end
		end
		number_of_wins
	end

	def losts
		number_of_losts = 0
		Match.where(player1: self).each do |match|
			if match.player1_score != 10
				number_of_losts += 1
			end
		end
		Match.where(player2: self).each do |match|
			if match.player2_score != 10
				number_of_losts += 1
			end
		end
		number_of_losts
	end

	def points
		number_of_points = 0
		#winning gives you 3 points
		#losing with 7 or more goals gives you 1 point
		Match.where(player1: self).each do |match|
			if match.player1_score == 10
				number_of_points += 3
			elsif (7..9).include?(match.player1_score)
				number_of_points += 1
			end
		end
		Match.where(player2: self).each do |match|
			if match.player2_score == 10
				number_of_points += 3
			elsif (7..9).include?(match.player1_score)
				number_of_points += 1
			end
		end
		number_of_points
	end


end
