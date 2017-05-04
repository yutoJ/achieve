# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
1.times do |n|
    email = Faker::Internet.email
    name = Faker::LordOfTheRings.character
    password = ENV['SEED_USER_PASSWORD']
    User.create!(
        email: email,
        name: name,
        password: password,
        password_confirmation: password,
    )
end

10.times do |n|
    title = Faker::Book.title
    content = Faker::Space.company
    user_id = 1
    Blog.create!(
        title: title,
        content: content,
        user_id: user_id,
    )
end
