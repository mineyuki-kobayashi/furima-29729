class UserOrder
  include ActiveModel::Model
  attr_accessor :postal, :source_id, :city, :address, :building, :telephone, :item_id, :user_id, :order_id, :token
  # purchasesテーブルのバリデーション
  with_options presence: true do
    validates :postal, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Input full-width characters.' }
    validates :source_id, numericality: { other_than: 1 }
    validates :city
    validates :address
    validates :telephone, format: { with: /\A\d{11}\z/ }
    validates :token
  end

  def save
    # 購入者と出品者をリンクさせた情報を@orderに代入
    order = Order.create(user_id: user_id, item_id: item_id)
    # 購入者情報をpurchasesテーブルに保存し、@purchaseに代入
    Purchase.create(order_id: order.id, postal: postal, source_id: source_id, city: city, address: address, building: building, telephone: telephone)
  end
end
