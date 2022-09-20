FactoryBot.define do
  factory :item do
    item_name {'商品名'}
    description {'商品説明'}
    category_id { Faker::number,between(from: 2, to: 11)}
    condition_id { Faker::number,between(from: 2, to: 7)}
    delivery_charge_id { Faker::number,between(from: 2, to: 3)}
    prefecture_id { Faker::number,between(from: 2, to: 48)}
    delivery_date_id { Faker::number,between(from: 2, to: 4)}
    price{ Faker::number,between(from: 300, to: 9_999_999)}
  end
end
