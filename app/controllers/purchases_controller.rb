class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
  end
  
  def create
    @purchase = PurchaseShippingAddress.new(purchase_params)
    if @purchase.valid?
      @purchase.save
      return redirect_to root_path
    else
      render :index
    end
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  private

  def purchase_params
    params.permit(:item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id)
  end

end
