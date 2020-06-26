require "open-uri"
# file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
# article = Article.new(title: 'NES', body: "A great console")
# article.photo.attach(io: file, filename: 'nes.png', content_type: 'image/png')

# https://kitt.lewagon.com/placeholder/users/random#{rand(1..30)}

# <%= cl_image_tag current_user.photo.key, height: 40, width: 40, crop: :thumb, gravity: :face, class: "card-avatar avatar-bordered %>"


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning the database...'
Tag.destroy_all
Booking.destroy_all
Photographer.destroy_all
User.destroy_all

puts 'Creating photo tags...'
tags = ['Nature', 'Animals', 'Pet', 'People', 'Portrait', 'Lifestyle', 'City', 'Water', 'Wind', 'Sun', 'Sea', 'River', 'Tree', 'Sport', 'Building', 'Culture', 'Religion', 'Music', 'Art']
tags.each do |tag|
  new_tag = Tag.new(tag_name: tag)
  new_tag.save
end

puts 'Creating users and photographers...'
30.times do
  new_user = User.new(name: Faker::FunnyName.name, email: Faker::Internet.email,
    password: '123456', password_confirmation: '123456')
  file = URI.open("https://thispersondoesnotexist.com/")
  new_user.photo.attach(io: file, filename: "profilepic.png", content_type: 'image/png')
  new_user.save
  new_photographer = Photographer.new(
    name: Faker::FunnyName.name,
    location: Faker::Address.city,
    description: Faker::Quote.yoda,
    price: rand(75..150)
    )
  new_photographer.user = new_user
  new_photographer.save
  6.times do
    pic = Photograph.new(photographer: new_photographer)
    filepic = URI.open("https://source.unsplash.com/random")
    pic.photo.attach(io: filepic, filename: "uploadpic.png", content_type: 'image/png')
    pic.save
    rescue ActiveStorage::IntegrityError
    filepic = URI.open("https://unsplash.com/photos/oR0uERTVyD0")
    pic.photo.attach(io: filepic, filename: "uploadpic.png", content_type: 'image/png')
  end
  rescue ActiveStorage::IntegrityError
  file = URI.open("https://images.unsplash.com/photo-1549068106-b024baf5062d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80")
  new_user.photo.attach(io: file, filename: "profilepic.png", content_type: 'image/png')
  # file = URI.open('https://giantbomb1.cbsistatic.com/uploads/original/9/99864/2419866-nes_console_set.png')
  # new_user.photo.attach(io: file, filename: "profilepic.png", content_type: 'image/png')
end

puts 'Done'
