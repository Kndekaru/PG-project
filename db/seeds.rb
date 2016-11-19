# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Post.delete_all
Comment.delete_all

users = 10.times.map do
  User.create!( :username => Faker::Internet.user_name,
                :email => Faker::Internet.email,
                :password => "password" )
end

posts = 30.times.map do
  Post.create!( :title => Faker::StarWars.quote,
                :content => Faker::Hipster.paragraph,
                :user_id => (1..10).to_a.sample )
end

comments = 200.times.map do
  Comment.create!( :reply => Faker::Hacker.say_something_smart,
                   :post_id => (1..30).to_a.sample,
                   :user_id => (1..10).to_a.sample )
end
