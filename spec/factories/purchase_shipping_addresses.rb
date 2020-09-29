FactoryBot.define do
  factory :purchase_shipping_address do
    token { "tok_abcdefghijk00000000000000000" } 
    postal_code { "123-4567" }
    prefecture_id { 2 }
    city { "さいたま市" }
    address { "夢町1-2-3" }
    building_name { "希望ハイツ" }
    phone_number { "09012345678" }
  end
end