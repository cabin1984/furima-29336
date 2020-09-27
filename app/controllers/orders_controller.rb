class OrdersController < ApplicationController
  def index
  end

  def new
    @order = PurchaseOrder.new
  end

  def create
    @order = PurchaseOrder.new(order_params)
    @order.save
  end

  private

  def order_params
    params.require(:purchase_order).permit(:user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase_id)
  end

end
