Category.where(name: "Web Development").first_or_create(name: "Web Development")
Category.where(name: "Design").first_or_create(name: "Design")
Category.where(name: "Finance").first_or_create(name: "Finance")

location = [
  "Osaka, umeda",
  "Osaka, takatsuki",
  "Osaka, ibaragi",
  "Osaka, namba",
  "Osaka, nishinagahori"
]

User.where(email: "test@test.com").first_or_create(email: "test", password: "testtest")

10.times do
  User.create(email: Faker::Internet.email, password: "samplesample")
end

100.times do
  Gig.create(name: Faker::Name.title,
            description: Faker::Lorem.paragraph(2),
            budget: rand(200..100000),
            location: location.sample,
            user_id: 1,
            category_id: rand(1..3))
end
