class Donation
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :address, :building, :phone_number, :user_id, :item_id, :token

  with_options presence: true do
    validates :token
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "半角数字10〜11桁で入力してください" }
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id, token: token)
    Addless.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building: building, phone_number: phone_number, order_id: order.id)
  end
end