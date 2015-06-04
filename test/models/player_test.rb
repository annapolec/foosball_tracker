require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  
  test "player's atributes must not be empty" do
  	player = Player.new
  	assert player.invalid?
  	assert player.errors[:first_name].any?
  	assert player.errors[:last_name].any?	
  end
  

def new_player(image)
	Player.new(first_name: "Ania",
				last_name: "Polec",
				avatar_file_name: image)
end

 test "avatar file name should be valid " do
	ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
			 http://a.b.c/x/y/z/fred.gif }
	bad = %w{ fred.doc fred.gif/more fred.gif.more }
	
	ok.each do |name|
		assert new_player(name).valid?, "#{name} should be valid"
	end

	bad.each do |name|
		assert new_player(name).invalid?, "#{name} shouldn't be valid"
	end
  end


end
