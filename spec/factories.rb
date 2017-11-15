FactoryBot.define do
  factory :book do
    author  Faker::Book.author
    title   Faker::Book.title
    year    Faker::Number.between(1700, 2017)
    publisher Faker::Book.publisher
    genre   Faker::Book.genre
    image   Faker::Avatar.image
  end
end
