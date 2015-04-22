class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_cart!
  
  def show
  end

  def new
    gon.client_token = generate_new_client_token
  end

  def edit
   @credit_card = current_user.default_credit_card
   @tr_data = edit_customer_tr_data
  end

  def create
    @result = Braintree::Transaction.sale(
              amount: current_user.cart_total_price,
              payment_method_nonce: params[:payment_method_nonce])
    if @result.success?
      current_user.purchase_cart_products!
      redirect_to root_url, notice: "Congraulations! You've purchased new products successfully!"
    else
      flash[:alert] = "Something went wrong while processing your transaction. Please try again!"
      gon.client_token = generate_new_client_token
      render :new
    end
  end

  private
  def generate_new_client_token
    Braintree::ClientToken.generate
  end

def check_cart!
    if current_user.get_cart_products.blank?
      redirect_to root_url, alert: "Please add some items to your cart before processing your transaction!"
    end  
end
  end

