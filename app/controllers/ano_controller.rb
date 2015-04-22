class AnoController < ApplicationController

	def create
      current_user.purchase_cart_movies!
      redirect_to root_url, notice: "Congraulations! You've purchased new movies successfully!"
  end

  def endd
    cart_ids = $redis.smembers current_user_cart
    @cart_products = Product.find(cart_ids)
   end

  

		 
   def current_user_cart
    "cart#{current_user.id}"
  end

end
