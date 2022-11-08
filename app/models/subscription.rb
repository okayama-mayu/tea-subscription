class Subscription < ApplicationRecord
  validates_presence_of :title 
  validates_presence_of :price 
  validates :price, numericality: true 
  validates_presence_of :status 
  validates :status, numericality: true 
  validates_presence_of :frequency
  validates :frequency, numericality: true 

  enum status: { active: 0, cancelled: 1 }
  enum frequency: { biweekly: 0, monthly: 1, quaterly: 2 }

  belongs_to :tea 
  belongs_to :customer
end