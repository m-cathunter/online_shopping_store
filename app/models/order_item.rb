class OrderItem < ApplicationRecord
  validates_presence_of :quantity, :price
  belongs_to :order
  belongs_to :product

  def price_for_product
    case self.product.discount
    when 'no-discount'
      default_price_counting
    when 'buy-one-get-one-free'
      if self.quantity.even?
        default_price_counting / 2
      else
        ((self.quantity+1) * self.price) /2
      end
    when '3 or more'
      if self.quantity >= 3
        self.quantity * (self.price = 4.50)
      else
        default_price_counting
      end
    end
  end

  private

  def default_price_counting
    self.quantity * self.price
  end
end
