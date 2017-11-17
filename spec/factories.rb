FactoryBot.define do
  factory :book do
    author  Faker::Book.author
    title   Faker::Book.title
    year    Faker::Number.between(1700, 2017)
    publisher Faker::Book.publisher
    genre   Faker::Book.genre
    image   Faker::Avatar.image
  end

  factory :user do
    email   Faker::Internet.email
    password Faker::Internet.password
    password_confirmation { password }
    first_name  Faker::Name.first_name
    last_name   Faker::Name.last_name
  end
end
