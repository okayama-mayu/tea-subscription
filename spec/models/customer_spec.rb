require 'rails_helper' 

RSpec.describe Customer, type: :model do 
  describe 'validations' do 
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address) }

    it { should validate_uniqueness_of(:email) }
    it { should allow_value('sally@gmail.com').for(:email) }
    it { should_not allow_value('1234').for(:email) }
  end
  
  describe 'relationships' do 
    it { should have_many :subscriptions }
    it { should have_many(:teas).through(:subscriptions) }
  end
end