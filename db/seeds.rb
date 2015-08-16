# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

30.times do |n|
	first_name = Faker::Name.first_name
	last_name = Faker::Name.last_name
	email = "example-#{n+1}@example.com"
	password = "password"
	password_confirmation = "password"
	points = rand(0..50)
	Player.create!(	first_name: first_name,
									last_name: last_name,
									email: email,
									password: password,
									password_confirmation: password_confirmation,
									points: points)
end

29.times do |n|
	date = Time.at(1.year.ago + rand * (Time.now.to_f - 1.year.ago.to_f))
	player1 = Player.find(n+1)
	player2 = Player.find(n+2)
	player1_score = 10
	player2_score = rand(0..9).to_i
	Match.create!(date: date,
								player1: player1,
								player2: player2,
								player1_score: player1_score,
								player2_score: player2_score)
end
29.times do |n|
	date = Time.at(1.year.ago + rand * (Time.now.to_f - 1.year.ago.to_f))
	player1 = Player.find(n+1)
	player2 = Player.find(30-n)
	player1_score = rand(0..9).to_i
	player2_score = 10
	Match.create!(date: date,
								player1: player1,
								player2: player2,
								player1_score: player1_score,
								player2_score: player2_score)
end

30.times do |n|
	match = Match.find(n+1)
	3.times do |m|
		c = Hash.new(content: Faker::Lorem.sentence)
		comment = match.comments.build(c[:content])
		player_id = rand(30)
		comment.player_id = player_id
		comment.save!
	end
end
