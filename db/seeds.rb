require "open-uri"

puts "Cleaning database..."
User.destroy_all
Plant.destroy_all
Booking.destroy_all

puts "Creating plants..."

user = User.create(name: 'lisa', email: 'lisa@me.com', password: '1234561')

20.times do
  plant = Plant.create(
    user_id: user.id,
    name: Faker::Name.first_name,
    species: %w[cactus lily rosebush monstera spider-plant].sample,
    category: %w[succulents cacti houseplants].sample,
    price: rand(3..15),
    address: Faker::Address.full_address,
    description: %w[beautiful colourful pretty].sample,
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
  )
    file = URI.open('https://images.unsplash.com/photo-1510520745063-ceaa7314a820?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
    plant.photos.attach(io: file, filename: 'plant.png', content_type: 'image/png')
    plant.save
  puts "Created #{plant.name}"
end

puts "Finished!"
