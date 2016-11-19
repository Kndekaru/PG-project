
User.delete_all
Post.delete_all
Comment.delete_all

10.times.map do
  User.create!( :username => Faker::Internet.user_name,
                :email => Faker::Internet.email,
                :password => "password" )
end

30.times.map do
  Post.create!( :title => Faker::StarWars.quote,
                :content => Faker::Hipster.paragraph,
                :user_id => (1..10).to_a.sample )
end

200.times.map do
  Comment.create!( :reply => Faker::Hacker.say_something_smart,
                   :post_id => (1..30).to_a.sample,
                   :user_id => (1..10).to_a.sample )
end
