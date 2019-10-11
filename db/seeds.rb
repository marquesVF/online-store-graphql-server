# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create first_name: 'John', last_name: 'Mark', email: 'john@mail.com', password: '1'

Post.create title: 'Look at this!', content: 'Have you ever danced?', url: 'https://www.youtube.com/watch?v=dQw4w9WgXcQ', user_id: user.id

