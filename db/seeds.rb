puts "Cleaning database..."
Plant.destroy_all
User.destroy_all

puts "Creating plants..."

user = User.create(name: 'lisa', email: 'lisa@me.com', password: '1234561')

20.times do
  plant = Plant.create(
    user: user,
    name: Faker::Name.first_name,
    species: %w[cactus lily rosebush monstera spider-plant].sample,
    category: %w[succulents cacti houseplants].sample,
    price: rand(3..15),
    address: Faker::Address.full_address,
    description: Faker::Hipster.sentences,
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude
  )
  puts "Created #{plant.name}"
end

puts "Finished!"
