require 'test_helper'

class MatchTest < ActiveSupport::TestCase

	test "match's atributes must not be empty" do
	  	match = Match.new
	  	assert match.invalid?
	  	assert match.errors[:date].any?
	  	assert match.errors[:player1_id].any?	
	  	assert match.errors[:player2_id].any?	
	  	assert match.errors[:player1_score].any?	
	  	assert match.errors[:player2_score].any?	
  end

  def new_match(score1, score2)
	Match.new(date: "12/12/2012",
				player1_id: 1,
				player2_id: 2,
				player1_score: score1,
				player2_score: score2 )
	end

  test "scores should >=0 and <=10" do
  		assert new_match(-3, 10).invalid?
  		assert new_match(10, 15).invalid?
  		assert new_match(-5, 23).invalid?
  		assert new_match(2, 10).valid?
  end

end
