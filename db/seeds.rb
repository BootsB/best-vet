# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
categories = Category.create([
  { title: "General", description: "Explore general pet care topics including tips, advice, and best practices for keeping your furry friend happy and healthy." },
  { title: "Health Concerns", description: "Discover common health issues, symptoms, treatments, and preventive care for pets to ensure their well-being." },
  { title: "Behavior and Training", description: "Learn effective training techniques and positive reinforcement methods for managing pet behavior." },
  { title: "Nutrition and Diet", description: "Get insights and advice for pet nutrition and feeding guidelines for a balanced diet and optimal health." },
  { title: "Emergency Care", description: "Be prepared for pet emergencies with information on recognizing signs of distress and administering first aid." },
  { title: "Senior Pet Care", description: "Discover tips for providing the best care to senior pets and managing age-related health issues." },
  { title: "Community", description: "Stay connected with our pet-loving community and get involved in events promoting pet welfare." }
])

user = User.create(email: "example@example.com", password: "password")

categories.each do |category|
  3.times do |i|
    Post.create!(
      title: "Post #{i + 1} in #{category.title}",
      content: "This is post #{i + 1} in the #{category.title} category. Sample text",
      category: category,
      user_id: 1
    )
  end
end
