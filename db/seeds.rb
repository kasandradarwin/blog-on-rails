# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Post.destroy_all
Comment.destroy_all
User.destroy_all

PASSWORD = "123"

super_user = User.create(
    first_name: "Admin",
    last_name: "User",
    email: "admin@user.com",
    password: PASSWORD,
    admin?: true
)

# p super_user

10.times do
    p "create users"
    first_name = Faker::Name.first_name
    last_name = Faker::Name.last_name

    User.create(
    first_name: first_name,
    last_name: last_name,
    email: "#{first_name}@#{last_name}.com",
    password: PASSWORD,
    admin?: false
    )
end

users = User.all

50.times do 
    created_at = Faker::Date.backward(days: 365 * 5)

    q = Post.create(
        title: Faker::Company.bs,
        body: Faker::Lorem.paragraph(sentence_count: 6, supplemental: true),
        created_at: created_at,
        updated_at: created_at,
        # updated_at: index.days.ago,
        user: users.sample
    )  
    
puts q.errors.full_messages
end


posts = Post.all
comments = Comment.all

p posts.count
p "end"