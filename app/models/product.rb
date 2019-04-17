class Product < ApplicationRecord
  validates_presence_of :product_code, :name, :price, :discount
end
