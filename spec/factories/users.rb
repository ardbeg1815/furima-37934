FactoryBot.define do
  factory :user do
    nick_name             {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {'1a' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name             {Faker::Japanese::Name.last_name}
    first_name            {Faker::Japanese::Name.first_name}
    kana_last             {Faker::Japanese::Name.last_name.yomi}
    kana_first            {Faker::Japanese::Name.first_name.yomi} 
    birth_day             {Faker::Date.birthday(min_age:5,max_age:65)}
  end
end