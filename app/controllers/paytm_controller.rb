class PaytmController < ApplicationController
    include PaytmHelper
    skip_before_action :verify_authenticity_token  
    before_action :get_paytm_keys
    
  def start_payment
    @product = Product.find(params[:product_id])
    @address = params[:address]
    paramList = Hash.new
    paramList["MID"] = @paytm_keys[:merchant_id]
    paramList["ORDER_ID"] = "#{Time.now.to_i.to_s}"
    paramList["CUST_ID"] = current_user.id
    paramList["INDUSTRY_TYPE_ID"] = @paytm_keys[:industry_type]
    paramList["CHANNEL_ID"] = @paytm_keys[:channel_id]
    paramList["TXN_AMOUNT"] = @product.price
    paramList["WEBSITE"] = @paytm_keys[:website]
    @paramList = paramList
    paramList["CALLBACK_URL"] =
    "http://localhost:3000/verify_payment?user_id=#{current_user.id}&product_id=#{@product.id}&address=#{CGI.escape(@address)}"
    @checksum_hash = generate_checksum() 
  end

  def verify_payment
    paytmparams = Hash.new
    keys = params.keys
      keys.each do |k|
        paytmparams[k] = params[k]
      end
    @checksum_hash = paytmparams["CHECKSUMHASH"]
    paytmparams.delete("CHECKSUMHASH")
    paytmparams.delete("controller")
    paytmparams.delete("action")
    @paytmparams = paytmparams
    @is_valid_checksum = verify_checksum()
    @user = User.find(params[:user_id])
    @product = Product.find(params[:product_id])
    # if @is_valid_checksum == true
      if @paytmparams["STATUS"] == "TXN_SUCCESS"
        sign_in(@user) if @user.present?
        OrderInfo.order(params[:product_id], params[:user_id], params[:address])
      else
        if @paytmparams["STATUS"] == "TXN_FAILURE"
          sign_in(@user) if @user.present?
        end
      end
    # end
  end
      
   private

   def get_paytm_keys
     @paytm_keys = Rails.application.credentials.send("paytm")
   end
end
