class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create, :pay_item]

  def index
    @order = UserOrder.new
    if current_user.id ==  @item.user_id
      return redirect_to root_path
    end
  end

  def create
    @order = UserOrder.new(order_params)
    if  @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

    def pay_item
      Payjp.api_key = "sk_test_fa863f2c894d87a87f7a44b4"  # PAY.JPテスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency:'jpy'                 # 通貨の種類(日本円)
      )
    end
    
    def set_item
      @item = Item.find(params[:item_id])
    end

  
  def order_params
    params.permit(:token, :postal, :source_id, :city, :address, :building, :telephone, :order_id, :item_id).merge(user_id: current_user.id)
  end

  

end
