class CartsController < ApplicationController
  before_action :authenticate_user!
		 		
  def show
    cart_ids = $redis.smembers current_user_cart
    @cart_products = Product.find(cart_ids)
  end

		def endd
    cart_ids = $redis.smembers current_user_cart
    @cart_products = Product.find(cart_ids)
  end      

  def add
    $redis.sadd current_user_cart, params[:product_id]
    render json: current_user.cart_count, status: 200
  end

  def remove
    $redis.srem current_user_cart, params[:product_id]
    render json: current_user.cart_count, status: 200
  end

		private
  def check_cart!
    if current_user.get_cart_products.blank?
      redirect_to root_url, alert: "Please add some items to your cart before processing your transaction!"
    end
end

  private
  def current_user_cart
    "cart#{current_user.id}"
  end

end 
