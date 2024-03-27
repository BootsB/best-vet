require "faker"
require "open-uri"

Appointment.destroy_all
PetProfile.destroy_all
Post.destroy_all
Category.destroy_all
UserProfile.destroy_all
User.destroy_all
Membership.destroy_all



# Output the number of existing users before creating new ones
puts "Number of existing users: #{User.count}"

file1 = URI.open("https://res.cloudinary.com/dg9mc7ach/image/upload/v1711130227/GENERAL_eqrhxe.png")
file2 = URI.open("https://res.cloudinary.com/dg9mc7ach/image/upload/v1711130227/HEALTH_CONCERNS_r6y5mc.png")
file3 = URI.open("https://res.cloudinary.com/dg9mc7ach/image/upload/v1711130228/BEHAVIOURS_TRAINING_yb179z.png")
file4 = URI.open("https://res.cloudinary.com/dg9mc7ach/image/upload/v1711130228/NUTRITION_AND_DIET_dabtja.png")
file5 = URI.open("https://res.cloudinary.com/dg9mc7ach/image/upload/v1711130229/EMERGENCY_CARE_dz1vqx.png")
file6 = URI.open("https://res.cloudinary.com/dg9mc7ach/image/upload/v1711130230/SENIOR_PET_CARE_xx8ri8.png")
file7 = URI.open("https://res.cloudinary.com/dg9mc7ach/image/upload/v1711130230/COMMUNITY_nxgnrv.png")

general = Category.new(
  title: "General",
  description: "Explore general pet care topics including tips, advice, and best practices for keeping your furry friend happy and healthy."
)
general.photo.attach(io: file1, filename: "general.png", content_type: "image/png")
general.save!

health_concerns = Category.new(
  title: "Health Concerns",
  description: "Discover common health issues, symptoms, treatments, and preventive care for pets to ensure their well-being."
)
health_concerns.photo.attach(io: file2, filename: "health-concerns.png", content_type: "image/png")
health_concerns.save!

behavior_and_training = Category.new(
  title: "Behaviour and Training",
  description: "Learn effective training techniques and positive reinforcement methods for managing pet behavior."
)
behavior_and_training.photo.attach(io: file3, filename: "behavior-training.png", content_type: "image/png")
behavior_and_training.save!

nutrition_and_diet = Category.new(
  title: "Nutrition and Diet",
  description: "Get insights and advice for pet nutrition and feeding guidelines for a balanced diet and optimal health."
)
nutrition_and_diet.photo.attach(io: file4, filename: "nutrition-diet.png", content_type: "image/png")
nutrition_and_diet.save!

emergency_care = Category.new(
  title: "Emergency Care",
  description: "Be prepared for pet emergencies with information on recognizing signs of distress and administering first aid."
)
emergency_care.photo.attach(io: file5, filename: "emergency-care.png", content_type: "image/png")
emergency_care.save!

senior_pet_care = Category.new(
  title: "Senior Pet Care",
  description: "Discover tips for providing the best care to senior pets and managing age-related health issues."
)
senior_pet_care.photo.attach(io: file6, filename: "senior_pet_care.png", content_type: "image/png")
senior_pet_care.save!

community = Category.new(
  title: "Community",
  description: "Stay connected with our pet-loving community and get involved in events promoting pet welfare."
)
community.photo.attach(io: file7, filename: "community.png", content_type: "image/png")
community.save!

# Create a single user
user = User.create!(email: "example@example.com", password: "password")

# General Category
Post.create!(
  title: "Question about grooming",
  content: "I have a long-haired cat and I'm struggling with grooming. Any tips on how to make the process easier?",
  category: Category.all[0],
  user: user
)
Post.create!(
  title: "Pet socialization",
  content: "My new puppy seems to be having trouble socializing with other dogs. What are some ways I can help him overcome this?",
  category: Category.all[0],
  user: user
)
Post.create!(
  title: "Traveling with pets",
  content: "I'm planning a road trip with my cat. Any advice on making the journey comfortable and stress-free for her?",
  category: Category.all[0],
  user: user
)

# Health Concerns Category
Post.create!(
  title: "Concerned about my dog's weight",
  content: "My dog seems to be gaining weight rapidly despite no changes in diet or exercise. Should I be worried? What could be causing this?",
  category: Category.all[1],
  user: user
)
Post.create!(
  title: "Hair loss in cats",
  content: "My cat has been shedding a lot more than usual and I've noticed some bald patches. What could be causing this and how can I help?",
  category: Category.all[1],
  user: user
)
Post.create!(
  title: "Chronic ear infections",
  content: "My dog keeps getting ear infections despite regular cleaning. What can I do to prevent them?",
  category: Category.all[1],
  user: user
)

# Behavior and Training Category
Post.create!(
  title: "Puppy biting problem",
  content: "My puppy keeps biting everything, including me. How can I train him to stop this behavior?",
  category: Category.all[2],
  user: user
)
Post.create!(
  title: "Fear of thunderstorms",
  content: "My dog gets extremely anxious during thunderstorms. Any tips on how to help him feel calmer?",
  category: Category.all[2],
  user: user
)
Post.create!(
  title: "Teaching my cat tricks",
  content: "I want to teach my cat some tricks. Where should I start?",
  category: Category.all[2],
  user: user
)

# Nutrition and Diet Category
Post.create!(
  title: "Transitioning to a new diet",
  content: "I want to switch my cat's food to a healthier option. How can I transition her to the new diet without upsetting her stomach?",
  category: Category.all[3],
  user: user
)
Post.create!(
  title: "Homemade dog treats",
  content: "I'd like to start making homemade treats for my dog. Any easy recipes to get started?",
  category: Category.all[3],
  user: user
)
Post.create!(
  title: "Food allergies in pets",
  content: "My cat seems to have developed an allergy to her food. How can I identify the allergen and find a suitable alternative?",
  category: Category.all[3],
  user: user
)

# Emergency Care Category
Post.create!(
  title: "First aid for a cut paw",
  content: "My dog cut her paw while playing outside. What should I do to treat the wound before taking her to the vet?",
  category: Category.all[4],
  user: user
)
Post.create!(
  title: "Choking hazard",
  content: "My cat swallowed a small object and is coughing. What should I do?",
  category: Category.all[4],
  user: user
)
Post.create!(
  title: "Heatstroke prevention",
  content: "With summer approaching, I'm concerned about my dog overheating. What are some signs of heatstroke and how can I prevent it?",
  category: Category.all[4],
  user: user
)

# Senior Pet Care Category
Post.create!(
  title: "Managing arthritis in older cats",
  content: "My senior cat has been showing signs of arthritis lately. Are there any home remedies or supplements I can give her to ease her discomfort?",
  category: Category.all[5],
  user: user
)
Post.create!(
  title: "Senior dog's declining appetite",
  content: "My elderly dog has been eating less lately. Should I be concerned?",
  category: Category.all[5],
  user: user
)
Post.create!(
  title: "Dental care for senior pets",
  content: "How can I maintain good dental health for my senior dog?",
  category: Category.all[5],
  user: user
)

# Community Category
Post.create!(
  title: "Pet adoption event",
  content: "Our local shelter is hosting a pet adoption event next weekend. What can I do to help promote it and encourage people to adopt?",
  category: Category.all[6],
  user: user
)
Post.create!(
  title: "Fundraising for animal rescue",
  content: "I'm interested in organizing a fundraiser for our local animal rescue organization. Any suggestions on how to get started?",
  category: Category.all[6],
  user: user
)
Post.create!(
  title: "Lost pet alert",
  content: "My neighbor's cat has gone missing. How can we spread the word and increase the chances of finding her?",
  category: Category.all[6],
  user: user
)

# Output the ID of the created user
puts "Created user ID: #{user.id}"

file8 = URI.open("https://res.cloudinary.com/dg9mc7ach/image/upload/v1711391837/BASIC%20MEMBERSHIP.png")
file9 = URI.open("https://res.cloudinary.com/dg9mc7ach/image/upload/v1711391837/PREMIUM.png")
file10 = URI.open("https://res.cloudinary.com/dg9mc7ach/image/upload/v1711391837/PAW%20PARTNER.png")

basic = Membership.new(
  name: "Basic",
  price: 0.00,
  description: "The free membership grants you unrestricted access to our forum, enabling you to post inquiries and engage with fellow pet owners and veterinarians alike. Please note that video call functionality is not included with this membership tier."
)
basic.photo.attach(io: file8, filename: "basic.png", content_type: "image/png")
basic.save!

premium = Membership.new(
  name: "Premium",
  price: 7.99,
  description: "Alongside unlimited access to our forum for discussions with pet owners and veterinarians, you'll also enjoy the added benefit of unlimited video calls with licensed professionals."
)
premium.photo.attach(io: file9, filename: "premium.png", content_type: "image/png")
premium.save!

paw_partner = Membership.create!(
  name: "Paw Partner",
  price: 13.99,
  description: "We understand the financial challenges many pet parents face in providing veterinary care. With our Paw Partner Membership, you not only gain unlimited access to our forum and video calls with licensed veterinarians but also extend the same lifeline to another pet parent in need."
)
paw_partner.photo.attach(io: file10, filename:"paw-partner.png", content_type: "image/png")
paw_partner.save!

# Output Membership Types
puts "Created 3 membership types"

# Output the number of existing user profiles before creating new ones
puts "Number of existing user profiles: #{UserProfile.count}"

# Create users
5.times do
  password = "123456"

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
    membership_id: Membership.find_by(name: "Premium").id, # Randomly assign membership level
    location: Faker::Address.city,
    city: Faker::Address.city,
    phone_number: Faker::PhoneNumber.phone_number,
    state: Faker::Address.state_abbr,
    zip_code: Faker::Address.zip_code,
    licence_number: Faker::Number.number(digits: 8) # Generate a random 8-digit license number
  )
  if user.vet?
    fileuser_url = "https://res.cloudinary.com/dg9mc7ach/image/upload/v1711210040/3jlk5a1ev1fycwmsfmvxfrq0jm1b.jpg"
  else
    fileuser_url = "https://res.cloudinary.com/dg9mc7ach/image/upload/v1711552933/pre_vet-main_or0axy.jpg"
  end

  fileuser = URI.open(fileuser_url)
  user_profile.photo.attach(io: fileuser, filename: "profile_image.png", content_type: "image/png")

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
    filepet_url = "https://res.cloudinary.com/dg9mc7ach/image/upload/v1709135262/1gtofk0exrobkn1d0zg8x29e0axu.avif"
    filepet = URI.open(filepet_url)
    pet_profile.photo.attach(io: filepet, filename: "profile_image_pet.png", content_type: "image/png")

    pet_profile.save!
  end


  # Create appointments for each user
  3.times do
    appointment = Appointment.new(
      appointment_date: Faker::Date.forward(days: 30), # Random date within the next 30 days
      status: [0, 1, 2, 3].sample, # Randomly assign status
      appointment_time: Faker::Time.between(from: DateTime.now, to: DateTime.now + 1, format: :default), # Random time within the next day
      description_of_problem: Faker::Lorem.paragraph
      # Add any other attributes you have for the Appointment model
    )
    appointment.user = user
    appointment.pet_profile = PetProfile.all.sample
    appointment.save!
  end
end
