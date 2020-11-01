FactoryBot.define do
  factory :purchase_shipping do
    postal_code { "123-1234" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    address { Faker::Address.street_address }
    building { Faker::Address.building_number }
    tel { Faker::Number.leading_zero_number(digits: 10) }
    token { "tok_abcdefghijk00000000000000000" }
  end
end
