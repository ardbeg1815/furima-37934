FactoryBot.define do
  factory :donation do
    token {"tok_abcdefghijk00000000000000000"}
    post_code { '123-4567' }
    prefecture_id { 2 }
    municipalities { '旭川' }
    address { '100-100' }
    building { '旭川ハイツ '}
    phone_number { '09012345678' }
    user_id { 1 }
    item_id { 1 }
  end
end
