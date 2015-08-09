# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.delete_all

Player.create!(first_name: 'Piotr', 
			   last_name: 'Lis')


Player.create!(first_name: 'Olga', 
			   last_name: 'Madej')

Player.create!(first_name: 'Paula', 
			   last_name: 'Nowak')
 