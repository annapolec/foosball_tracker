class Player < ActiveRecord::Base
	validates :first_name, :last_name, :avatar, presence: true
 	validates :avatar, allow_blank: true, format: {
		with: %r{\.(gif|jpg|png)\Z}i,
		message: 'avatar format must be GIF, JPG or PNG'
	}

end
