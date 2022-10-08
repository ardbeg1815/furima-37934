require 'rails_helper'

RSpec.describe Donation, type: :model do
  before do
    @donation = FactoryBot.build(:donation)
end
  describe "商品購入機能" do
    describe "購入できる時" do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@donation).to be_valid
      end
      it '建物名は空でも登録できる' do
        @donation.building = ""
        @donation.valid?
        expect(@donation).to be_valid
      end
    end

    describe"購入できないとき" do
      it 'トークンがなければ登録できない' do
        @donation.token = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Token can't be blank")
      end
      it '郵便番号が空では登録できない' do
        @donation.post_code = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号はハイフンがなければ登録できない' do
        @donation.post_code = 1234567
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end

      it '都道府県が空では登録できない' do
        @donation.prefecture_id = 1
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市町村区が空では登録できない' do
        @donation.municipalities = ""
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空では登録できない' do
        @donation.address = ""
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @donation.phone_number = ""
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号は９桁以下では登録できない' do
        @donation.phone_number = 123456789
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Phone number 10〜11桁で入力してください")
      end
      it '電話番号は１２桁以上では登録できない' do
        @donation.phone_number = 123456789012
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Phone number 10〜11桁で入力してください")
      end
      it 'user_idは空では登録できない' do
        @donation.user_id = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idは空では登録できない' do
        @donation.item_id = nil
        @donation.valid?
        expect(@donation.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end