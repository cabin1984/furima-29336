require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品機能' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品が上手くいく時' do
      it '全ての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '出品が上手く行かない時' do
      it 'imageが空だと保存できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it 'product_nameが空だと保存できないこと' do
        @item.product_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product name can't be blank")
      end

      it 'product_descriptionが空だと保存できないこと' do
        @item.product_description = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product description can't be blank")
      end

      it 'category_idが1だと保存できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      
      it 'product_status_idが1だと保存できないこと' do
        @item.product_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Product status must be other than 1")
      end

      it 'shipping_fee_burden_idが1だと保存できないこと' do
        @item.shipping_fee_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee burden must be other than 1")
      end

      it 'shipping_region_idが1だと保存できないこと' do
        @item.shipping_region_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping region must be other than 1")
      end

      it 'estimated_shipping_date_idが1だと保存できないこと' do
        @item.estimated_shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Estimated shipping date must be other than 1")
      end

      it 'price_idが空だと保存できないこと' do
        @item.price_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it 'price_idは半角数字で入力しないと保存できないこと' do
        @item.price_id = '１２３４５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end

      it 'price_idが10000000円以上で入力すると保存できないこと' do
        @item.price_id = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it 'price_idが299円以下で入力すると保存できないこと' do
        @item.price_id = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it 'ユーザーが紐付いていないと保存できないこと' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end  
end
