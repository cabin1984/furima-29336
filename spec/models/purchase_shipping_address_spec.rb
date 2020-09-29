require 'rails_helper'

RSpec.describe PurchaseShippingAddress, type: :model do
  before do
    @purchase_shipping_address = FactoryBot.build(:purchase_shipping_address)
  end

  describe '商品購入機能' do
    context "商品が購入できる場合" do
      it "全ての値が正しく入力されていれば購入できる" do
        expect(@purchase_shipping_address).to be_valid
      end

      it 'building_nameは空でも購入できること' do
        @purchase_shipping_address.building_name = nil
        expect(@purchase_shipping_address).to be_valid
      end
    end
    
    context "商品が購入できない場合" do
      it "tokenが空だと購入できない" do
        @purchase_shipping_address.token = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Token can't be blank")
      end

      it "postal_codeが空だと購入できない" do
        @purchase_shipping_address.postal_code = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code can't be blank")
      end

      it "postal_codeにハイフンを入れないと購入できない" do
        @purchase_shipping_address.postal_code = '1234567'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it "prefecture_idが1の場合は購入できない" do
        @purchase_shipping_address.prefecture_id = 1
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Prefecture can't be blank")
      end

      it "cityが空だと購入できない" do
        @purchase_shipping_address.city = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("City can't be blank")
      end

      it "addressが空だと購入できない" do
        @purchase_shipping_address.address = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Address can't be blank")
      end

      it "phone_numberが空だと購入できない" do
        @purchase_shipping_address.phone_number = nil
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number can't be blank")
      end

      it "phone_numberは12桁以上では購入できない" do
        @purchase_shipping_address.phone_number = '111111111111'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is out of setting range")
      end

      it "phone_numberにハイフンを入れると購入できない" do
        @purchase_shipping_address.phone_number = '111-1111-1111'
        @purchase_shipping_address.valid?
        expect(@purchase_shipping_address.errors.full_messages).to include("Phone number is out of setting range")
      end
    end
  end
end