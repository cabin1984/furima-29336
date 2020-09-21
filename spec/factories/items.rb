FactoryBot.define do
  factory :item do
    product_name               { Faker::Commerce.name }
    product_description        { Faker::Lorem.sentence }
    category_id                { Faker::Number.number(1) }
    product_status_id          { 2 }
    shipping_fee_burden_id     { Faker::Number.number(1) }
    shipping_region_id         { Faker::Number.number(1) }
    estimated_shipping_date_id { Faker::Number.number(1) }
    price_id                   { 10_000 }
    association :user

    after(:build) do |content|
      content.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
