# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Post.destroy_all
Comment.destroy_all



200.times do
    created_at = Faker::Date.backward(days: 365 * 5)

    q = Post.create(
        title: 
        body: Faker::Hacker.say_something_smart,
        view_count: rand(100_000),
        created_at: created_at,
        updated_at: created_at,
        user: users.sample
    )
    # if q.valid?
    #     rand(1..5).times do
    #         Answer.create(body: Faker::Hacker.say_something_smart, question: q, user: users.sample)
    #     end
    # end

end

posts = Post.all
comments = Comment.all
