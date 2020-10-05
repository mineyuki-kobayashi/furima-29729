require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    buyer = FactoryBot.create(:user)
    seller = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: seller.id)
    @order = FactoryBot.build(:user_order, user_id: buyer.id, item_id: item.id)
  end
  describe '商品購入' do
    context '商品購入がうまくいく時' do
      it '必須項目に記入がある時登録できる' do
        expect(@order).to be_valid
      end
      it 'カード情報を入力してあれば購入できる' do
        @order.token = 'abcdefg'
        expect(@order).to be_valid
      end
      it '配送先が入力してあれば購入できる' do
        @order.postal = '123-4567'
        @order.city = '横浜市緑区'
        @order.address = '青山1-1-1'
        @order.building = '柳ビル103'
        @order.telephone = '09012345678'
        @order.source_id = '2'
        expect(@order).to be_valid
      end
      it '建物名が空であっても購入できる' do
        @order.building = nil
        expect(@order).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      # カード情報
      it 'カード情報が空の時' do
        @order.token = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      # 配送先入力
      it '郵便番号が空の時' do
        @order.postal = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal can't be blank")
      end
      it '郵便番号にハイフン(-)がない時' do
        @order.postal = '1234567'
        @order.valid?
        expect(@order.errors.full_messages).to include('Postal is invalid. Input full-width characters.')
      end
      # source_id 1 は初期値
      it '都道府県選択なし' do
        @order.source_id = '1'
        @order.valid?
        expect(@order.errors.full_messages).to include('Source must be other than 1')
      end
      it '市区町村が空' do
        @order.city = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空' do
        @order.address = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      # 電話番号
      it '電話番号が空' do
        @order.telephone = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Telephone can't be blank")
      end
      it '電話番号にハイフンがある' do
        @order.telephone = '090-1234-5678'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone is invalid')
      end
      it '11桁以上の記述があった場合' do
        @order.telephone = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include('Telephone is invalid')
      end
    end
  end
end
