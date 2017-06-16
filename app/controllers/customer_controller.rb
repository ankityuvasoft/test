class CustomerController < ApplicationController
  def new
    @customer = Customer.new
  end
  def create_customer
    debugger
    @customer=Customer.create(customer_params)
    @user=User.create(email:params[:customer][:email],password:"123456")
    if @customer.save
      debugger
      @amount = params[:price]

      customer = Stripe::Customer.create(
      email: params[:stripeEmail],
      source: params[:stripeToken])

      charge = Stripe::Charge.create(
      customer: Customer.ids,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'usd')
     redirect_to customers_path
    end
    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to new_charge_path
    end
  
  private
  def customer_params
    params.require(:customer).permit!
  end
end