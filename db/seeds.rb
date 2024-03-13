require "faker"

# Output the number of existing users before creating new ones
puts "Number of existing users: #{User.count}"

categories = Category.create([
  { title: "General", description: "Explore general pet care topics including tips, advice, and best practices for keeping your furry friend happy and healthy." },
  { title: "Health Concerns", description: "Discover common health issues, symptoms, treatments, and preventive care for pets to ensure their well-being." },
  { title: "Behavior and Training", description: "Learn effective training techniques and positive reinforcement methods for managing pet behavior." },
  { title: "Nutrition and Diet", description: "Get insights and advice for pet nutrition and feeding guidelines for a balanced diet and optimal health." },
  { title: "Emergency Care", description: "Be prepared for pet emergencies with information on recognizing signs of distress and administering first aid." },
  { title: "Senior Pet Care", description: "Discover tips for providing the best care to senior pets and managing age-related health issues." },
  { title: "Community", description: "Stay connected with our pet-loving community and get involved in events promoting pet welfare." }
])

# Create a single user
user = User.create(email: "example@example.com", password: "password")

# Output the ID of the created user
puts "Created user ID: #{user.id}"

# Output the number of existing user profiles before creating new ones
puts "Number of existing user profiles: #{UserProfile.count}"

# Create users
5.times do
  password = Faker::Internet.password

  user = User.create(
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password,
    vet: [true, false].sample # Randomly assign whether the user is a vet or not
    # Add any other attributes you have for the User model
  )

  # Save the user before creating the user profile
  user.save!

  # Create a user profile for each user
  user_profile = user.create_user_profile(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.street_address,
    description: Faker::Lorem.sentence,
    membership: Faker::Number.between(from: 1, to: 5), # Randomly assign membership level
    location: Faker::Address.city,
    city: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip_code,
    licence_number: Faker::Number.number(digits: 8) # Generate a random 8-digit license number
    # Add any other attributes you have for the UserProfile model
  )

  user_profile.save!

  2.times do
    pet_profile = PetProfile.new(
      name: Faker::Creature::Dog.name,
      species: 'Dog', # You can customize this for your needs
      breed: Faker::Creature::Dog.breed,
      age: Faker::Number.between(from: 1, to: 15),
      gender: ['Male', 'Female'].sample, # Randomly assign gender
      description: Faker::Lorem.sentence,
      vaccinations: Faker::Lorem.sentence,
      weight: Faker::Number.between(from: 1, to: 50), # Randomly assign weight in kg
      microchip: [true, false].sample, # Randomly assign microchip status
      neutered: [true, false].sample # Randomly assign neutered status
      # Add any other attributes you have for the PetProfile model
    )
    pet_profile.user = user
    pet_profile.save!
  end


  # Create appointments for each user
  3.times do
    appointment = Appointment.new(
      appointment_date: Faker::Date.forward(days: 30), # Random date within the next 30 days
      status: ['Pending', 'Confirmed', 'Cancelled'].sample, # Randomly assign status
      appointment_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1, format: :default), # Random time within the next day
      description_of_problem: Faker::Lorem.paragraph
      # Add any other attributes you have for the Appointment model
    )
    appointment.user = user
    appointment.pet_profile = PetProfile.all.sample
    appointment.save!
  end
end
