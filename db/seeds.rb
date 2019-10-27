require 'faker'

10.times do
    user = User.create(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        password: "1"
    )
    10.times do
        post = Post.create(
            user: user,
            title: Faker::Book.title,
            content: Faker::Lorem.paragraph,
            url: Faker::Internet.url
        )
        Comment.create(post: post, content: Faker::Lorem.paragraph, user: user)
    end
end
