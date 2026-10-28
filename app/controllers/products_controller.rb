class ProductsController < ApplicationController
  def index
    @products = Product.order(:id)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.save!

    redirect_to products_path,
                notice: "商品を登録しました",
                status: :see_other
  end

  def destroy
    product = Product.find(params[:id])
    product.destroy!

    redirect_to products_path,
                notice: "商品を削除しました",
                status: :see_other
  end

  private

  def product_params
    params.require(:product).permit(:name, :price)
  end
end