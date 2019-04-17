class ShoppingCart

  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token, status: 'cart') do |order|
      order.total_price = 0
    end
  end

  def add_order_item(product_id:, quantity: 1)
    product = Product.find(product_id)

    order_item = order.order_items.find_or_initialize_by(product_id: product_id)

    order_item.price = product.price
    order_item.quantity = quantity

    order_item.save
  end
end