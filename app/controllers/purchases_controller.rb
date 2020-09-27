class PurchasesController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase = ItemPurchase.new
  end

  def create
    @purchase = ItemPurchase.new(purchase_params)
    @purchase.save
  end

  private

  def purchase_params
    params.require(:purchase_order).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase_id).merge(user_id: current_user.id, item_id: params[:item.id])
  end

end
