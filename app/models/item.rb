class Item < ApplicationRecord
  with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equel_to: 300, less_than_or_equel_to: 9_999_999 }
  end

  validates :image,              presence: true
  validates :item_name,          presence: true
  validates :description,        presence: true
  validates :category_id,        numericality: { other_than: 1 }
  validates :condition_id,       numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id,      numericality: { other_than: 1 }
  validates :delivery_date_id,   numericality: { other_than: 1 }

  has_one_attached :image
  belongs_to :user
end
