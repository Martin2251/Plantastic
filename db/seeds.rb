puts "Cleaning database..."
Plant.destroy_all
User.destroy_all

puts "Creating plants..."

user = User.create(name: 'lisa',email: 'lisa@me.com', password: '1234561')

cactus = {user: user, name: "bob", species: "cactus", category: "succulent", price: 10, address: "London", description: "spiky", longitude: 0, latitude: 0}
lily = {user: user, name: "lily", species: "lily", category: "flower", price: 8, address: "London", description: "colourful", longitude: 0, latitude: 0}

[ cactus, lily ].each do |attributes|
  plant = Plant.create!(attributes)
  puts "Created #{plant.name}"
end
puts "Finished!"
