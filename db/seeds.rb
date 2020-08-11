require "open-uri"

puts "Cleaning database..."
Plant.destroy_all
User.destroy_all

puts "Creating plants..."

user = User.create(name: 'lisa', email: 'lisa@me.com', password: '1234561')

file = URI.open('https://images.unsplash.com/photo-1459411552884-841db9b3cc2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=818&q=80')
20.times do
  plant = Plant.create(
    user_id: user.id,
    name: Faker::Name.first_name,
    species: %w[cactus lily rosebush monstera spider-plant].sample,
    category: %w[succulents cacti houseplants].sample,
    price: rand(3..15),
    address: Faker::Address.full_address,
    description: Faker::Hipster.sentences,
    longitude: Faker::Address.longitude,
    latitude: Faker::Address.latitude,
    image_url: 'https://hips.hearstapps.com/vader-prod.s3.amazonaws.com/1568042845-Cactus_mix_yellow_2048x.jpg?crop=0.838xw:0.838xh;0.0705xw,0.122xh'
  )
    # plant.photos.attach(io: file, filename: 'plant.png', content_type: 'image/png')
    plant.save
  puts "Created #{plant.name}"
end

puts "Finished!"
