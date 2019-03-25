FactoryBot.define do
  factory :product do
      name { Faker::Food.dish }
      sold_out { Faker::Boolean.boolean }
      category { Faker::Restaurant.type }
      under_sale { Faker::Boolean.boolean }
      price { Faker::Number.between(1, 10000) }
      sale_price { Faker::Number.between(10, 3000) }
      sale_text { "#{Faker::Number.between(1, 50)}\% OFF" }
  end
end