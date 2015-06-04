# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.delete_all

Player.create!(first_name: 'Piotr', 
			   last_name: 'Lis', 
			   avatar: 'Piotr_Lis.jpg')


Player.create!(first_name: 'Olga', 
			   last_name: 'Madej', 
			   avatar: 'Olga_Madej.jpg')

Player.create!(first_name: 'Paula', 
			   last_name: 'Nowak', 
			   avatar: 'Paula_Nowak.jpg')
 