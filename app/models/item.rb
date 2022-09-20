class Item < ApplicationRecord
  validates :item_name,   presence: true
  validates :description, presence: true
  validates :price,       presence: true
            
  varidates :category_id,        numericality: { other_than: 1 }
  validates :condition_id,       numericality: { other_than: 1 }
  validates :delivery_charge_id, numericality: { other_than: 1 }
  validates :prefecture_id,      numericality: { other_than: 1 }
  validates :delivery_date_id,   numericality: { other_than: 1 }
end
