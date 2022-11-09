require 'rails_helper' 

RSpec.describe 'Subscriptions API' do 
  before :each do 
    @mayu = Customer.create!(first_name: 'Mayu', last_name: 'Takeda', email: 'mayu@email.com', address: 'New Orleans, LA')
    @nicole = Customer.create!(first_name: 'Nicole', last_name: 'Esquer', email: 'nicole@email.com', address: 'Tuscon, AZ')

    @green = Tea.create!(name: 'green', description: 'it is good', temperature: 95, brew_time: 3)
    @earl = Tea.create!(name: 'earl grey', description: 'it is strong', temperature: 80, brew_time: 4)

    @nicole_green = Subscription.create!(title: 'Nicoles Green tea subscription', price: 10, frequency: 3, tea_id: @green.id, customer_id: @nicole.id)
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
  
  it 'cancels a subscription' do 
    subs_params = { status: 1 }
    headers = { "CONTENT_TYPE" => "application/json" }

    patch "/api/v1/subscriptions/#{@nicole_green.id}", headers: headers, params: JSON.generate({subscription: subs_params})

    updated = Subscription.last  
    expect(response).to be_successful
    expect(updated.status).to eq 'cancelled'
  end

  it 'throws an error if wrong input' do 
    subs_params = { status: 2 }
    headers = { "CONTENT_TYPE" => "application/json" }

    patch "/api/v1/subscriptions/#{@nicole_green.id}", headers: headers, params: JSON.generate({subscription: subs_params})

    updated = Subscription.last  
    expect(response).to have_http_status(422)
    expect(updated.status).to eq 'active'
    expect(response.body).to include("'2' is not a valid status")
  end

  it 'retrieves all subscriptions given a Customer id' do 
    nicole_earl = Subscription.create!(title: 'Nicoles Earl Grey tea subscription', price: 8, frequency: 0, tea_id: @earl.id, customer_id: @nicole.id, status: 1)

    nicole_earl_v2 = Subscription.create!(title: 'Nicoles Earl Grey tea subscription', price: 12, frequency: 2, tea_id: @earl.id, customer_id: @nicole.id)
    
    get "/api/v1/subscriptions/#{@nicole.id}"

    expect(response).to be_successful

    response_body = JSON.parse(response.body, symbolize_names: true)

    subs = response_body[:data]

    expect(subs.count).to eq 3

    subs.each do |subscription| 
      expect(subscription).to have_key :id 
      expect(subscription[:id]).to be_an(Integer)
      
      expect(subscription).to have_key :type 
      expect(subscription[:type]).to eq 'subscription'
      
      expect(subscription).to have_key :attributes
      expect(subscription[:attributes][:title]).to be_a(String)
      expect(subscription[:attributes][:price]).to be_an(Integer)
      expect(subscription[:attributes][:status]).to be_a(String)
      expect(subscription[:attributes][:frequency]).to be_a(String)
      expect(subscription[:attributes][:tea_id]).to be_an(Integer)
      expect(subscription[:attributes][:customer_id]).to be_an(Integer)
    end
  end
end