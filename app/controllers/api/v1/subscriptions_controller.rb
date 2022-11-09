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
    sub.update!(subscription_params)
    render json: SubscriptionSerializer.format_subscription(sub), status: :ok
  end

  private 
    def subscription_params
      params.require(:subscription).permit(:title, :price, :frequency, :tea_id, :customer_id, :status)
    end
end