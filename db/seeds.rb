# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'activerecord-reset-pk-sequence'

users = User.all
users.delete_all
users.reset_pk_sequence

city = City.all
city.delete_all
city.reset_pk_sequence

gossip = Gossip.all
gossip.delete_all
gossip.reset_pk_sequence

tags = Tag.all
tags.delete_all
tags.reset_pk_sequence

gossip_tags = GossipTag.all
gossip_tags.delete_all
gossip_tags.reset_pk_sequence

 10.times do
   cities = City.create!(
     city_name: Faker::Address.city,
     zip_code: Faker::Address.zip_code
   )
 end

10.times do
  users = User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    description: Faker::Quote.unique.famous_last_words,
    city_id: rand(1..10)
  )
end

20.times do
  gossips = Gossip.create!(
    title: Faker::Book.title,
    content: Faker::GreekPhilosophers.quote,
    user_id: rand(1..10)
  )
end

10.times do
  tags = Tag.create!(
    tag: "#" + Faker::Superhero.unique.descriptor
  )
end

30.times do
  gossip_tags = GossipTag.create!(
    tag_id: rand(1..10),
    gossip_id: rand(1..20)
  ) 
end

puts "Seed done!"