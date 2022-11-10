# Take Home Challenge 

## About This Challenge 
To see the full Challenge description, please click [here](https://mod4.turing.edu/projects/take_home/take_home_be). 

### From the Challenge: 

You will create a Rails API for a Tea Subscription Service.

Requirements:
At a minimum, you must create:
- An endpoint to subscribe a customer to a tea subscription
- An endpoint to cancel a customer’s tea subscription
- An endpoint to see all of a customer’s subsciptions (active and cancelled)

Things we’ll be looking for:
- A strong understanding of Rails
- Ability to create restful routes
- Demonstration of well-organized code, following OOP
- Test Driven Development
- Clear documentation

## Local Setup 
This project requires:
 * `Ruby 2.7.4`
 * `Rails 5.2.8.1`
### Setup Steps
 * Fork the repository
 * Clone the fork
 * Install gems and set up your database:
   * `bundle install`
   * `rails db:create`
   * `rails db:migrate`

## Schema
<img width="750" alt="image" src="https://user-images.githubusercontent.com/102258223/201002392-1d4fc9ad-fb20-4842-8764-59f2697ed326.png">
   
## Endpoints

### Subscribe a Customer to a Tea Subscription 
- `post "/api/v1/subscriptions"`

Example Body (in raw JSON format): 
``` 
{
    "title": "Mayus Green Tea Subscription",
    "price": "8",
    "frequency": "monthly", 
    "tea_id": "1", 
    "customer_id": "1"
}
``` 

Example Response: 
```
{
    "data": {
        "id": 2,
        "type": "subscription",
        "attributes": {
            "title": "Mayus Green Tea Subscription",
            "price": 8,
            "status": "active",
            "frequency": "monthly",
            "tea_id": 1,
            "customer_id": 1
        }
    }
}
```

### Change a Customer's Subscription Status (active or cancelled)  
- `patch "/api/v1/subscriptions/{{:subscription_id}}"`

Example Body (in raw JSON format): 
``` 
{
    "status": "cancelled"
}
``` 

Example Response: 
```
{
    "data": {
        "id": 1,
        "type": "subscription",
        "attributes": {
            "title": "Nicoles Green tea subscription",
            "price": 10,
            "status": "cancelled",
            "frequency": "one_time",
            "tea_id": 1,
            "customer_id": 2
        }
    }
}
```

### Retrieve All Subscriptions (Active and Cancelled) Associated with a Customer
- `get "/api/v1/subscriptions/{{:customer_id}}"`

Example Response: 
```
{
    "data": [
        {
            "id": 1,
            "type": "subscription",
            "attributes": {
                "title": "Nicoles Green tea subscription",
                "price": 10,
                "status": "active",
                "frequency": "one_time",
                "tea_id": 1,
                "customer_id": 2
            }
        },
        {
            "id": 2,
            "type": "subscription",
            "attributes": {
                "title": "Nicole's Earl Grey Tea Subscription",
                "price": 12,
                "status": "cancelled",
                "frequency": "biweekly",
                "tea_id": 2,
                "customer_id": 2
            }
        }
    ]
}
```
## Test Coverage
This application was developed using TDD through RSpec with 100% coverage as measured by Simplecov. 
<img width="1434" alt="image" src="https://user-images.githubusercontent.com/102258223/201003253-314491a1-a386-46eb-9c5c-dc4826deaf26.png">
