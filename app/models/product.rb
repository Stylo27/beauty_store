class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  validates :price, presence: true

  scope :from_price,    ->(price) { where('price >= ?', price) }
  scope :to_price,      ->(price) { where('price <= ?', price) }

  def self.by_categories(categories)
    where('category ILIKE ANY ( array[?] )', categories)
  end

  def self.price_range(price_from, price_to)
    where('price BETWEEN ? AND ?', price_from, price_to)
  end
end
