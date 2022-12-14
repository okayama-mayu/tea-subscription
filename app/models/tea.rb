class Tea < ApplicationRecord 
  validates_presence_of :name
  validates_presence_of :description
  validates_presence_of :temperature
  validates :temperature, numericality: true 
  validates_presence_of :brew_time, numericality: true 
  validates :brew_time, numericality: true 
  
  has_many :subscriptions
  has_many :customers, through: :subscriptions
end