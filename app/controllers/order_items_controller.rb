class OrderItemsController < ApplicationController

  def index
    @order_items = current_cart.order.order_items
  end

  def create
    current_cart.add_order_item(
      product_id: params[:product_id],
      quantity: params[:quantity]
    )

    redirect_to cart_path
  end

  def destroy
    current_cart.remove_order_item(id: params[:id])
    redirect_to cart_path
  end
end