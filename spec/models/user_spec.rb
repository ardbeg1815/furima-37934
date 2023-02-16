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
    it "passwordは数字のみ不可" do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordは英字のみ不可" do
      @user.password = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordは全角不可" do
      @user.password = '全角１２３４'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordとpassword(確認)の一致" do
      @user.password = 'abc123'
      @user.password_confirmation = 'def456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "名字必須" do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it "名前必須" do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it "名字は半角数字不可" do
      @user.last_name = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "名字は半角英字不可" do
      @user.last_name = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it "名前は半角数字不可" do
      @user.first_name = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "名前は半角英字不可" do
      @user.first_name = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it "カナ名字必須" do
      @user.kana_last = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last can't be blank")
    end
    it "カナ名前必須" do
      @user.kana_first = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first can't be blank")
    end
    it "カナ名字漢字不可" do
      @user.kana_last = '高原'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last is invalid")
    end
    it "カナ名字ひらがな不可" do
      @user.kana_last = 'たかはら'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last is invalid")
    end
    it "カナ名字全角数字不可" do
      @user.kana_last = '１２３４５'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last is invalid")
    end
    it "カナ名字全角英字不可" do
      @user.kana_last = 'ａｂｃｄｅ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last is invalid")
    end
    it "カナ名字半角数字不可" do
      @user.kana_last = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last is invalid")
    end
    it "カナ名字半角英字不可" do
      @user.kana_last = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana last is invalid")
    end
    it "カナ名前漢字不可" do
      @user.kana_first = '正樹'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first is invalid")
    end
    it "カナ名前ひらがな不可" do
      @user.kana_first = 'なおき'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first is invalid")
    end
    it "カナ名字全角数字不可" do
      @user.kana_first = '１２３４５'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first is invalid")
    end
    it "カナ名字全角英字不可" do
      @user.kana_first = 'ａｂｃｄｅ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first is invalid")
    end
    it "カナ名字半角数字不可" do
      @user.kana_first = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first is invalid")
    end
    it "カナ名字半角英字不可" do
      @user.kana_first = 'abcde'
      @user.valid?
      expect(@user.errors.full_messages).to include("Kana first is invalid")
    end
    it "生年月日必須" do
      @user.birth_day = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
