class ProductsController < ApplicationController
  def index
    @products = Product.order(:name)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  private

  def product_params
    params.require(:product).permit(:product_code, :name, :price, :discount)
  end
end
