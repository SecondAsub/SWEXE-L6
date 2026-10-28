class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  validates :qty,
            numericality: {
              only_integer: true,
              greater_than: 0
            }

  def subtotal
    product.price * qty
  end
end