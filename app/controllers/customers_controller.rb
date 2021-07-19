class CustomersController < ApplicationController
  def index
    @customers = Customer.all
    p 11111111111
    p customers_c_path

    p customers_c_url
    p 11111111111

  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.create(cust_params)
    if @customer.save
      redirect_to customers_in_path
    else
      render :new
    end
  end

  private

    def cust_params
       params.require(:customer).permit(:name,:email,:password,:address)
    end
    
end
