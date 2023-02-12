FactoryBot.define do
  factory :item do
    after(:build) do |item|
    item.image.attach(io: File.open('app/assets/images/item-sample.png'), filename: 'test_image.png', content_type: 'image/png')
    end
    item_name          {'商品名'}
    description        {'商品説明'}
    category_id        { Faker::Number.between(from: 2, to: 11) }
    condition_id       { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    delivery_date_id   { Faker::Number.between(from: 2, to: 4) }
    price              { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end