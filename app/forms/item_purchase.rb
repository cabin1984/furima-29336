class ItemPurchase

  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :purchase_id

  with_options presence: true do
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :phone_number, format: { with: /\A[0-9]+\z/, message: "is invalid. Input half-width characters."}
  end

  validates :phone_number, numericality: { less_than_or_equal_to: 11, message: "is out of setting range"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    item = Item.create
    Purchase.create(user_id: user.id, item_id: item.id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end

end