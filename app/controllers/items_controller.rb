class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  #def edit
  #  @item = Item.find(params[:id])
  #end

  #def destroy
   # item = Item.find(params[:id])
    #item.destroy
    #redirect_to root_path
  #end
  private

  def item_params
    params.require(:item).permit(:price, :name, :explanation, :image, :category_id, :postage_id, :schedule_id, :source_id, :status_id, :image).merge(user_id: current_user.id)
  end

  
end
