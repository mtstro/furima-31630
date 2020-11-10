FactoryBot.define do
  factory :item_order do
    token        {"tok_abcdefghijk00000000000000000"}
    post_code    {Faker::Number.number(digits: 3).to_s + '-' + Faker::Number.number(digits: 4).to_s}
    region_id    {Faker::Number.within(range: 2..48)}
    city         {Faker::Address.city}
    address      {Faker::Address.secondary_address}
    phone_num    {Faker::Number.leading_zero_number(digits: 11)}
    association  :item
    association  :user
  end
end