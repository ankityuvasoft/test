class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end
def create
  debugger
  @subscription = Subscription.new(params[:subscription])
  if @subscription.save_with_payment
    redirect_to @subscription, :notice => "Thank you for subscribing!"
  else
    render :new
  end
end


end
