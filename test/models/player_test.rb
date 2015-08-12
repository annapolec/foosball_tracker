require 'test_helper'

class PlayerTest < ActiveSupport::TestCase  
  def setup
  	@player = Player.new(	first_name: 'John',
  												last_name: 'Smith',
  												email: 'smith@example.com',
  												password: 'password',
  												password_confirmation: 'password',
  												admin: false)
  end
  
  test 'should be valid' do
  	assert @player.valid?
  end

  test 'first_name should be present' do
  	@player.first_name = '   '
  	assert_not @player.valid?
  end

  test 'last_name should be present' do
  	@player.last_name = '     '
  	assert_not @player.valid?
  end
end
