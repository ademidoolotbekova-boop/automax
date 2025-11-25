# Clear existing data
puts "Clearing existing data..."
RefreshToken.destroy_all
User.destroy_all

# Create Admin
puts "Creating admin..."
admin = User.create!(
  email: "admin@example.com",
  name: "Admin",
  password: "GqzLumNhKR3HLEiC",
  password_confirmation: "GqzLumNhKR3HLEiC",
  admin: true
)

# Create regular users
puts "Creating regular users..."
5.times do |i|
  User.create!(
    email: "user#{i + 1}@example.com",
    name: "User #{i + 1}",
    password: "GqzLumNhKR3HLEiC",
    password_confirmation: "GqzLumNhKR3HLEiC",
    admin: false
  )
end

# Seed lessons
puts "\nSeeding lessons..."
load Rails.root.join('db', 'seeds', 'lessons.rb')

# Seed practice tests
puts "\nSeeding practice tests..."
load Rails.root.join('db', 'seeds', 'practice_tests.rb')

puts "\n✅ Seed data created successfully!"
puts "\nLogin credentials:"
puts "  Admin: admin@example.com / GqzLumNhKR3HLEiC"
puts "  Regular Users: user1@example.com - user5@example.com / GqzLumNhKR3HLEiC"
puts "\nTotal users created: #{User.count}"
puts "Total lesson categories: #{LessonCategory.count}"
puts "Total lessons: #{Lesson.count}"
puts "Total practice tests: #{PracticeTest.count}"
puts "Total questions: #{Question.count}"
