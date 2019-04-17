class Order < ApplicationRecord
  validates_presence_of :first_name, :last_name, :address, :email
  has_many :order_items
end
