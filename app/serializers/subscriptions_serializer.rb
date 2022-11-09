class SubscriptionsSerializer 
  def self.format_subscriptions(subs)
    {
      data: subs.map do |subscription| 
        { 
          id: subscription.id, 
          type: 'subscription', 
          attributes: {
            title: subscription.title, 
            price: subscription.price, 
            status: subscription.status, 
            frequency: subscription.frequency, 
            tea_id: subscription.tea_id, 
            customer_id: subscription.customer_id
          }
        }
      end
    }
  end
end