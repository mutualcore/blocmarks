require 'faker'

 # Create Users
 5.times do
   user = User.new(
     name:     Faker::Name.name,
     email:    Faker::Internet.email,
     password: Faker::Lorem.characters(10)
   )
   user.skip_confirmation!
   user.save!
 end
 users = User.all

# Create Topics
10.times do
  Topic.create!(
    user: users.sample,
    title:   Faker::Lorem.word)
end
topics = Topic.all

# Create Bookmarks
100.times do
  bookmark = Bookmark.create!(
    topic: topics.sample,
    url: Faker::Internet.url
    )
end
bookmarks = Bookmark.all

member = User.new(
  name: 'Member User', 
  email: 'member@example.com',
  password: 'helloworld',)
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Topic.count} topics created"
puts "#{Bookmark.count} posts created"