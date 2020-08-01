puts "Cleaning database..."
Plant.destroy_all
User.destroy_all

puts "Creating plants..."

user = User.create(email: 'example@me.com', password: '123456')

cactus = {user: user, name: "bob", photo: "test", species: "cactus", category: "succulent", price: 10, address: "London", description: "spiky", longitude: 0, latitude: 0}
lily = {user: user, name: "lily", photo: "test", species: "lily", category: "flower", price: 8, address: "London", description: "colourful", longitude: 0, latitude: 0}

[ cactus, lily ].each do |attributes|
  plant = Plant.create!(attributes)
  puts "Created #{plant.name}"
end
puts "Finished!"
