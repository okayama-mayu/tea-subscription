class Subscription < ApplicationRecord
  validates_presence_of :title 
  validates_presence_of :price 
  validates :price, numericality: true 
  validates_presence_of :status 
  validates :status, numericality: true 
  validates_presence_of :frequency
  validates :frequency, numericality: true 

  has_many :tea_subs
  has_many :customer_subscriptions
  has_many :customers, through: :customer_subscriptions
end