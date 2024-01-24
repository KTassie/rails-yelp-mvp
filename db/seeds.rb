# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ['Action', 'Comedy', 'Drama', 'Horror'].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts 'Destroying DB'
Restaurant.destroy_all

puts 'Creating restaurant seeds...'
the_farrier = { name: 'The Farrier', address: '89 Main Street, Cayton, Scarborough YO11 3RP', phone: '01723435432', category: 'chinese' }
embers = { name: 'Embers', address: '138 Victoria Road, Scarborough YO11 1SL', phone: '01723435432', category: 'italian' }
the_boat_shed = { name: 'The Boat Shed', address: '7 Murray Street, Filey YO14 9DA', phone: '01723563215', category: 'french' }
the_lifeboat_fish_bar = { name: 'Lifeboat Fish Bar', address: '76 Eastborough, Scarborough YO11 1NJ', phone: '01827364782', category: 'italian' }
the_grainary = { name: 'The Grainary', address: 'The Grainary Harwood Dale, Scarborough YO13 0DT', phone: '01723421345', category: 'italian' }

[the_farrier, embers, the_boat_shed, the_lifeboat_fish_bar, the_grainary].each do |atts|
  restaurant = Restaurant.create!(atts)
  puts "Created #{restaurant.name}"
end
puts 'Finito!'

the_farrier = Restaurant.find_by(name: 'The Farrier')
embers = Restaurant.find_by(name: 'Embers')
the_boat_shed = Restaurant.find_by(name: 'The Boat Shed')
the_lifeboat_fish_bar = Restaurant.find_by(name: 'Lifeboat Fish Bar')
the_grainary = Restaurant.find_by(name: 'The Grainary')

Review.create(content: 'Great food!', rating: 5, restaurant: the_farrier)
Review.create(content: 'Could be better.', rating: 3, restaurant: embers)
Review.create(content: 'Boat like!', rating: 4, restaurant: the_boat_shed)
Review.create(content: 'Smelt like fish! YUCK', rating: 1, restaurant: the_lifeboat_fish_bar)
Review.create(content: 'Amazing atmosphere.', rating: 4, restaurant: the_grainary)
