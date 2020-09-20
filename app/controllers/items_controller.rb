class ItemsController < ApplicationController
before_action :move_to_index

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :move_to_index
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :image, :product_description, :category_id, :product_status_id, :shipping_fee_burden_id, :shipping_region_id, :estimated_shipping_date_id, :price_id).merge(user_id: current_user.id)
  end
end
