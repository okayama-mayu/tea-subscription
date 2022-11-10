# customers 
mayu = Customer.create!(id: 1, first_name: 'Mayu', last_name: 'Takeda', email: 'mayu@email.com', address: 'New Orleans, LA')
nicole = Customer.create!(id: 2, first_name: 'Nicole', last_name: 'Esquer', email: 'nicole@email.com', address: 'Tuscon, AZ')

# teas
green = Tea.create!(id: 1, name: 'green', description: 'it is good', temperature: 95, brew_time: 3)
earl = Tea.create!(id: 2, name: 'earl grey', description: 'it is strong', temperature: 80, brew_time: 4)

# subscriptions 
nicole_green = Subscription.create!(id: 1, title: 'Nicoles Green tea subscription', price: 10, frequency: 3, tea_id: green.id, customer_id: nicole.id)