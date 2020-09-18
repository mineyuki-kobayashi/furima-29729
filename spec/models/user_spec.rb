require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it "必須項目に記入があるときは登録できる" do
          expect(@user).to be_valid
        end
        it "パスワードが６文字以上の英字と数字が両方あるときは登録できる" do
          @user.password = "123abc"
          @user.password_confirmation = @user.password
          expect(@user).to be_valid
        end
        it "お名前記入欄が全角であるとき登録できる" do
          @user.first_name = "山やまヤマ"
          @user.last_name = "山やまヤマ"
          expect(@user).to be_valid
          
        end
        it "フリガナ記入欄が全角カタカナであるとき登録できる" do
          @user.first_name_furigana = "ヤマ"
          @user.last_name_furigana = "ヤマ"
          expect(@user).to be_valid
        end
      end
      context '新規登録がうまくいかないとき' do
      #nickname
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      #email
      it "emailが空だと登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "emailに＠がついていないと登録できない" do
        @user.email = "test@test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      #password
      it "passwordが空だと登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが６文字以上でないと登録できない" do
        @user.password = "1a"
        @user.password_confirmation = "1a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが６文字以上でも数字だけだと登録できない" do
        @user.password = "111111"
        @user.password_confirmation = "111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが６文字以上でも英字だけだと登録できない" do
        @user.password = "aaaaaa"
        @user.password_confirmation = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end
      it "passwordが存在してもpassword_confirmationがからだと登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      #name
      it "first_nameが空だと登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "last_nameが空だと登録できない" do
        @user.last_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it "first_name_furiganaが空だと登録できない" do
        @user.first_name_furigana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana can't be blank")
      end
      it "last_name_furiganaが空だと登録できない" do
        @user.last_name_furigana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana can't be blank")
      end
      it "first_name_furiganaが全角カタカナでないと登録できない" do
        @user.first_name_furigana = "全角ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name furigana is invalid")
      end
      it "last_name_furiganaが全角カタカナでないと登録できない" do
        @user.last_name_furigana = "全角ひらがな"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name furigana is invalid")
      end
      #birthday
      it "dirthdayが空だと登録できない" do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end