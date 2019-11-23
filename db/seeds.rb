require 'faker'

user_ids = rand(1..30).times.map do
    User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "1"
    )
end

product_category_ids = 10.times.map do
    ProductCategory.create(
        description: Faker::Book.genre
    )
end

product_ids = rand(1..100).times.map do
    Product.create(
        name: Faker::Book.title,
        description: Faker::Lorem.sentence,
        price: rand(10..240),
        product_category: product_category_ids.sample
    )
end

100.times do
    Comment.create(
        user: user_ids.sample,
        product: product_ids.sample,
        content: Faker::Lorem.paragraph
    )
end
