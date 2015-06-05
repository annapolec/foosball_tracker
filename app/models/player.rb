class Player < ActiveRecord::Base

	has_attached_file :avatar, :styles => { medium: "300x300>", thumb: "100x100>" }, 
											default_url: "/images/:style/missing.png"

	validates :first_name, :last_name, presence: true
	validates :avatar, attachment_presence: true
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  	validates_attachment_file_name :avatar, matches: %r{\.(gif|jpg|png)\Z}i

end
