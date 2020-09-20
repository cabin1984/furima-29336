FactoryBot.define do
  factory :item do
    product_name               {"商品1"}
    product_descripion         {"商品１の説明"}
    category_id                {2}
    product_status_id          {2}
    shipping_fee_burden_id     {2}
    shipping_region_id         {2}
    estimated_shipping_date_id {2}
    price_id                   {3000}
    association :user
    
    after(:build) do |content|
      content.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
