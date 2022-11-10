class Api::V1::SubscriptionsController < ApplicationController 
  def create 
    sub = Subscription.new(subscription_params)

    if sub.save 
      render json: SubscriptionSerializer.format_subscription(sub), status: :ok 
    else 
      render json: ErrorSerializer.format_error(error_message(sub.errors)), status: :unprocessable_entity
    end
  end

  def update
    sub = Subscription.find(params[:id])
    begin 
      sub.update(subscription_params)
      render json: SubscriptionSerializer.format_subscription(sub), status: :ok
    rescue StandardError => e
      render json: ErrorSerializer.format_error(e.message), status: :unprocessable_entity
    end 
  end

  def show
    begin 
      customer = Customer.find(params[:id])
      subs = customer.subscriptions 
      render json: SubscriptionsSerializer.format_subscriptions(subs), status: :ok 
    rescue StandardError => e 
      render json: ErrorSerializer.format_error(e.message), status: :not_found 
    end 
  end

  private 
    def subscription_params
      params.require(:subscription).permit(:title, :price, :frequency, :tea_id, :customer_id, :status)
    end
end