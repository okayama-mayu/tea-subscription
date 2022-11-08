class Subscription < ApplicationRecord
  has_many :tea_subs
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions
end