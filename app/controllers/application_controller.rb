class ApplicationController < ActionController::Base
  before_action :current_cart
  helper_method :current_cart

  private

  def current_cart
    return @current_cart if @current_cart

    @current_cart = Cart.find_by(id: session[:cart_id])

    unless @current_cart
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end

    @current_cart
  end
end