require 'faker'

user_count = User.all.count

10.times do |f|             #cree 10 user avec une ville en reference
        User.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, description: Faker::Quote.famous_last_words, email: "henri#{f+user_count}@yopmail.com", encrypted_password:"Helloworld")
end
puts "10 utilisateurs crees"


10.times do  |index|    #cree 10 events
        Event.create!(title: "Event#{index}", description: Faker::ChuckNorris.fact, admin: User.all.sample, location: Faker::Address.full_address, price: rand(1..10)*5, duration: rand(1..10)*5, start_date: Faker::Date.forward(days: 100))
end
puts "10 evenements crees"



puts "all entries added"