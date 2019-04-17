class ShoppingCart
  delegate :total_price, to: :order

  def initialize(token:)
    @token = token
  end

  def order
    @order ||= Order.find_or_create_by(token: @token, status: 'cart') do |order|
      order.total_price = 0
    end
  end

  def order_items_count
    order.order_items.sum(:quantity)
  end

  def add_order_item(product_id:, quantity: 1)
    product = Product.find(product_id)

    order_item = order.order_items.find_or_initialize_by(product_id: product_id)

    order_item.price = product.price
    order_item.quantity = quantity

    ActiveRecord::Base.transaction do
      order_item.save
      update_total_price!
    end
  end

  def remove_order_item(id:)
    ActiveRecord::Base.transaction do
      order.order_items.destroy(id)
      update_total_price!
    end
  end

  private

  def update_total_price!
    order.total_price = order.order_items.sum(&:price_for_product)
    order.save
  end
end
