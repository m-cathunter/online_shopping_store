class AddProductToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :order_items, :product, index: true
    add_foreign_key :order_items, :products
  end
end
