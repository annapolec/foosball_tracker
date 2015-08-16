require 'test_helper'

class MatchTest < ActiveSupport::TestCase
	def setup
		@match = Match.new(	date: '23/06/2015',
												player1_id: 1,
												player2_id: 2,
												player1_score: 10,
												player2_score: 4)

	end

	test 'should be valid' do
		assert @match.valid?
	end

	test 'date should be present' do
			@match.date = '   '
			assert_not @match.valid?
	end	

	test 'players id should be present' do
			@match.player1_id = ''
			assert_not @match.valid?
			@match.player1_id = 1
			@match.player2_id = ''
			assert_not @match.valid?
	end	

	test 'players scores should be numbers between 0-10' do
		@match.player2_score = 11
		assert_not @match.valid?
		@match.player2_score = -3
		assert_not @match.valid?
		@match.player2_score = 'ala'
		assert_not @match.valid?
		@match.player2_score = 4.5
		assert_not @match.valid?
	end

	test 'there should be one winner' do
		@match.player1_score = 10
		@match.player2_score = 10
		assert_not @match.valid?
		@match.player1_score = 2
		@match.player2_score = 3
		assert_not @match.valid?
	end

	test 'players have to be different persons' do
		@match.player2_id = 1
		assert_not @match.valid?
	end
end
