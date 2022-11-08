# customers 
mayu = Customer.create!(first_name: 'Mayu', last_name: 'Takeda', email: 'mayu@email.com', address: 'New Orleans, LA')
nicole = Customer.create!(first_name: 'Nicole', last_name: 'Esquer', email: 'nicole@email.com', address: 'Tuscon, AZ')

# teas
green = Tea.create!(name: 'green', description: 'it is good', temperature: 95, brew_time: 3)
earl = Tea.create!(name: 'earl grey', description: 'it is strong', temperature: 80, brew_time: 4)

# subscriptions 
nicole_green = Subscription.create!(title: 'Nicoles Green tea subscription', price: 10, frequency: 3, tea_id: green.id, customer_id: nicole.id)