require 'rails_helper' 

RSpec.describe 'Subscriptions API' do 
  before :each do 
    @mayu = Customer.create!(first_name: 'Mayu', last_name: 'Takeda', email: 'mayu@email.com', address: 'New Orleans, LA')
    @nicole = Customer.create!(first_name: 'Nicole', last_name: 'Esquer', email: 'nicole@email.com', address: 'Tuscon, AZ')

    @green = Tea.create!(name: 'green', description: 'it is good', temperature: 95, brew_time: 3)
    @earl = Tea.create!(name: 'earl grey', description: 'it is strong', temperature: 80, brew_time: 4)
  end

  it 'creates a Subscription' do 
    subs_params = ({
      title: 'Mayus Green Tea Subscription', price: 8, frequency: 1, tea_id: @green.id, customer_id: @mayu.id
    })
    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/subscriptions", headers: headers, params: JSON.generate(subscription: subs_params)

    created_sub = Subscription.last 
    
    expect(response).to be_successful 
    expect(created_sub.title).to eq(subs_params[:title])
    expect(created_sub.price).to eq(subs_params[:price])
    expect(created_sub.frequency).to eq('monthly')
    expect(created_sub.tea_id).to eq(subs_params[:tea_id])
    expect(created_sub.customer_id).to eq(subs_params[:customer_id])
  end

  it 'throws an error if incorrect params' do 
    subs_params = ({
      title: '', price: 8, frequency: 1, tea_id: @green.id, customer_id: @mayu.id
    })
    headers = { "CONTENT_TYPE" => "application/json" }

    post "/api/v1/subscriptions", headers: headers, params: JSON.generate(subscription: subs_params)

    expect(response).to have_http_status(422)
    expect(response.body).to include("Title can't be blank")
  end
end