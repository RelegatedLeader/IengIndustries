# Seed admin user
admin = User.create_with(
  password: "password123",
  password_confirmation: "password123",
  first_name: "Admin",
  last_name: "User",
  role: :admin,
  verified: true
).find_or_create_by(email: "admin@ieng.com")

# Seed driver users
driver1 = User.create_with(
  password: "password123",
  password_confirmation: "password123",
  first_name: "Alex",
  last_name: "Driver",
  role: :driver,
  verified: true
).find_or_create_by(email: "driver1@ieng.com")

driver2 = User.create_with(
  password: "password123",
  password_confirmation: "password123",
  first_name: "Jordan",
  last_name: "Pilot",
  role: :driver,
  verified: true
).find_or_create_by(email: "driver2@ieng.com")

# Seed regular user
user = User.create_with(
  password: "password123",
  password_confirmation: "password123",
  first_name: "John",
  last_name: "Passenger",
  role: :user,
  verified: true
).find_or_create_by(email: "user@ieng.com")

# Seed locations
locations = [
  { name: "Central Station", latitude: 40.7128, longitude: -74.0060, location_type: :station, city: "New York", country: "USA" },
  { name: "Airport Hub", latitude: 40.7769, longitude: -73.8740, location_type: :hub, city: "New York", country: "USA" },
  { name: "Tech Valley Station", latitude: 42.6526, longitude: -73.7562, location_type: :station, city: "Albany", country: "USA" },
  { name: "Downtown Terminal", latitude: 40.7580, longitude: -73.9855, location_type: :stop, city: "New York", country: "USA" },
  { name: "Uptown Plaza", latitude: 40.7829, longitude: -73.9654, location_type: :landmark, city: "New York", country: "USA" },
  { name: "Waterfront Station", latitude: 40.7014, longitude: -74.0165, location_type: :station, city: "New York", country: "USA" }
]

locations.each { |loc| Location.find_or_create_by(name: loc[:name]) { |l| l.update(loc) } }

# Seed vehicles
vehicles_data = [
  { name: "Sky Bus Alpha", vehicle_type: :hover_bus, license_plate: "HB-001", capacity: 50, energy_type: :nuclear_fusion, hourly_rate: 150.0, driver: driver1 },
  { name: "Sky Bus Beta", vehicle_type: :hover_bus, license_plate: "HB-002", capacity: 50, energy_type: :solar_hybrid, hourly_rate: 140.0, driver: driver2 },
  { name: "Hover Taxi One", vehicle_type: :hover_taxi, license_plate: "HT-001", capacity: 4, energy_type: :nuclear_fusion, hourly_rate: 45.0, driver: driver1 },
  { name: "Hover Taxi Two", vehicle_type: :hover_taxi, license_plate: "HT-002", capacity: 4, energy_type: :solar_hybrid, hourly_rate: 40.0, driver: driver2 },
  { name: "Express Train One", vehicle_type: :advanced_train, license_plate: "AT-001", capacity: 200, energy_type: :nuclear_fusion, hourly_rate: 300.0, driver: driver1 },
  { name: "Teleport Chamber Prototype", vehicle_type: :teleport_chamber, license_plate: "TC-001", capacity: 1, energy_type: :nuclear_fusion, hourly_rate: 99.99, driver: admin }
]

vehicles_data.each do |data|
  Vehicle.find_or_create_by(license_plate: data[:license_plate]) { |v| v.update(data) }
end

puts "✅ Seeded 6 vehicles, 6 locations, and 3 users"
