# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning the database...'
Photographer.destroy_all
User.destroy_all

puts 'Creating users and photographers...'
30.times do
  new_user = User.new(email: Faker::Internet.email, password: '123456', password_confirmation: '123456')
  new_user.save
  new_photographer = Photographer.new(name: Faker::FunnyName.name,
    location: Faker::Address.city,
    description: Faker::Quote.yoda,
    price: rand(75..150))
  new_photographer.user = new_user
  new_photographer.save
end

puts 'Done'
