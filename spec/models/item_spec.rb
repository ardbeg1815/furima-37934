require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe "商品出品機能" do
    it "画像必須" do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it "商品名必須" do
      @item.item_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Item name can't be blank")
    end
    it "商品説明必須" do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it "カテゴリー必須" do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end
    it "コンディション必須" do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition can't be blank")
    end
    it "配送料の負担必須" do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery charge can't be blank")
    end
    it "発送元地域必須" do
      @item.prefecture_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Prefecture can't be blank")
    end
    it "発送までの日数必須" do
      @item.delivery_date_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery date can't be blank")
    end
    it "価格必須" do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end
    it "価格は半角英字不可" do
      @item.price = 'abc123'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "価格は全角不可" do
      @item.price = 'アイウエオ'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end
    it "価格は300円未満不可" do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end
    it "価格は10000000円以上不可" do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end
  end
end
