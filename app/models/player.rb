class Player < ActiveRecord::Base
	has_many :matches, dependent: :destroy
	has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	validates :first_name, :last_name, presence: true
	  
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

	def average_number_of_goals
		if number_of_matches != 0
			total_score/number_of_matches
		end
	end

	def position_in_classification
		classification = Player.all.sort_by(&:points).reverse
		position = 1
		classification.each do |player|
			return position if player.id == self.id 	
			position = position+1 
		end
	end

end
