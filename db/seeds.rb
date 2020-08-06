puts "Cleaning database..."
Plant.destroy_all
User.destroy_all

puts "Creating plants..."

user = User.create(name: 'lisa',email: 'lisa@me.com', password: '1234561')

cactus = {user: user, name: "bob", species: "cactus", category: "succulent", price: 10, address: "138 Kingsland Road, London", description: "spiky", longitude: -0.076810, latitude: 51.532580}
lily = {user: user, name: "lily", species: "lily", category: "flower", price: 8, address: "Greenwich, London", description: "colourful", longitude: -0.007659, latitude: 51.482578}

[ cactus, lily ].each do |attributes|
  plant = Plant.create!(attributes)
  puts "Created #{plant.name}"
end
puts "Finished!"
