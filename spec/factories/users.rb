FactoryBot.define do
  factory :user do
    nickname    {Faker::Name.last_name}
    email       {Faker::Internet.free_email}
    password = Faker::Internet.password(min_length: 6)
    password    {password}
    password_confirmation  {password}
    birthday    {Faker::Date.birthday(min_age: 18, max_age: 80)}

    transient do
      person { Gimei.name }
    end
    fam_name { person.last.kanji }
    fir_name { person.first.kanji }
    fam_name_read { person.last.katakana }
    fir_name_read { person.first.katakana }
  end
end