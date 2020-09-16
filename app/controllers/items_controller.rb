class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def created
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :product_description, :category_id, :product_status_id, :shipping_fee_burden_id, :shipping_region_id, :estimated_shipping_date_id)
    params.require(:item).permit(:product_image, :image).merge(user_id: current_user.id)
  end
end
