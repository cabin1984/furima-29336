class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :product_status
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_region
  belongs_to_active_hash :estimated_shipping_date
  belongs_to :user

  validates :product_name, :product_description, :category, :product_status, :shipping_fee_burden, :shipping_region, :estimated_shipping_date, presence: true

  validates :category_id, :product_status_id, :shipping_fee_burden_id, :shipping_region_id, :estimated_shipping_date_id, numericality: { other_than: 1 }
end
