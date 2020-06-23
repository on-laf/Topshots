# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Photographer.create!(
  name: 'Mario Gomez',
  location: 'Lisbon',
  description: 'I am the top shot of the top shots. Hire me!',
  price: 25.50,
  user_id: 1
)
