class Addless < ApplicationRecord
  #validates :post_code,      presence: true
  #validates :prefecture_id,  presence: true
  #validates :municipalities, presence: true
  #validates :address,        presence: true
  #validates :phone_number,   presence: true

  belongs_to :order
end
