class AddPriceForProductToOrderItems < ActiveRecord::Migration[5.2]
  def change
    add_column :order_items, :price_for_product, :integer, precision: 15, scale: 2
  end
end
