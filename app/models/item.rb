class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :estimated_shipping_date
  
  with_options presence: true do
    validates :image
    validates :product_name
    validates :product_description
    validates :category_id
    validates :product_status
    validates :shipping_fee_burden_id
    validates :shipping_region_id
    validates :estimated_shipping_date_id
    validates :price_id
  end
  validates :price_id, numericality: { only_integer: true, greater_than_or_equal_to:300, less_than_or_equal_to:300, less_than_or_equal_to:9999999, with: /\A[0-9]+\z/}

  validates :category_id, :product_status_id, :shipping_fee_burden_id, :shipping_region_id, :estimated_shipping_date_id, numericality: { other_than: 1 }
end
