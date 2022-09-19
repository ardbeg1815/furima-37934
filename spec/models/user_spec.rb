require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
end

  describe "ユーザー新規登録機能" do
    it "nick_name必須" do
      @user.nick_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nick name can't be blank")
    end
    it "email必須" do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it "emailは一意性" do
      @user.email = '123@456'
      @user.save
      @user = FactoryBot.build(:user)
      @user.email = '123@456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email has already been taken")
    end
    it "emailは@必須" do
      @user.email = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it "password必須" do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordは6文字以上" do
      @user.password = 'abc12'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "passwordは半角英数字混合" do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword(確認)の一致" do
      @user.password = 'abc123'
      @user.password_confirmation = 'def456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "名字,名前必須" do
      @user.last_name = ''
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank", "First name can't be blank")
    end
    it "名字,名前は全角(漢字・ひらがな、カタカナ)入力必須" do
      @user.last_name = 'naoki'
      @user.first_name = 'takahara'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid", "First name is invalid")
    end
    it "カナ名字,カナ名前必須" do
      @user.kana_last= ''
      @user.kana_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last can't be blank", "Kana first can't be blank")
    end
    it "カナ名字,カナ名前必須" do
      @user.kana_last= '高原'
      @user.kana_first = '正樹'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last is invalid", "Kana first is invalid")
    end
    it "生年月日必須" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
