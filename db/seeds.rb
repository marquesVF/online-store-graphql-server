# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

20.times do
    u = User.new(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "1"
    )
    u.save
    10.times do
        Post.create(
            user: u,
            title: Faker::Book.title,
            content: Faker::Lorem.paragraph,
            url: Faker::Internet.url
        )
    end
end