# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = %w( Salad Soup Entrees Chicken )
40.times do
  Product.create(
    name: Faker::Food.dish,
    sold_out: Faker::Boolean.boolean,
    category: categories[Random.rand(0..3)],
    under_sale: Faker::Boolean.boolean,
    price: Faker::Number.between(1000, 1000000),
    sale_price: Faker::Number.between(1000, 999999),
    sale_text: "#{Faker::Number.between(1, 50)}\% OFF"
  )
end
