FactoryBot.define do
  factory :item do
    name          {Faker::Lorem.sentence}
    about         {Faker::Lorem.sentence}
    category_id   {Faker::Number.within(range: 2..11)}
    status_id     {Faker::Number.within(range: 2..7)}
    ship_cost_id  {Faker::Number.within(range: 2..3)}
    region_id     {Faker::Number.within(range: 2..48)}
    ship_date_id  {Faker::Number.within(range: 2..4)}
    price         {Faker::Number.within(range: 300..9999999)}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
