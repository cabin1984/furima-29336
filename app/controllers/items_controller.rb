class ItemsController < ApplicationController
  before_action :move_to_index, only: [:new, :create]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order('created_at DESC')
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

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end

  def set_item
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:product_name, :image, :product_description, :category_id, :product_status_id, :shipping_fee_burden_id, :shipping_region_id, :estimated_shipping_date_id, :price_id).merge(user_id: current_user.id)
  end
end
