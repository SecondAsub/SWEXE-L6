class CartItemsController < ApplicationController
  def new
    @product = Product.find(params[:product_id])
    @cart_item = CartItem.new(product: @product, qty: 1)
  end

  def create
    @product = Product.find(cart_item_params[:product_id])
    added_qty = cart_item_params[:qty].to_i

    if added_qty < 1
      redirect_to products_path, alert: "数量は1以上にしてください"
      return
    end

    @cart_item =
      current_cart.cart_items.find_or_initialize_by(product: @product)

    @cart_item.qty = @cart_item.qty.to_i + added_qty

    if @cart_item.save
      redirect_to cart_path(current_cart),
                  notice: "商品をカートに追加しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    cart_item = current_cart.cart_items.find(params[:id])
    cart_item.destroy

    redirect_to cart_path(current_cart),
                notice: "商品をカートから削除しました",
                status: :see_other
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:product_id, :qty)
  end
end