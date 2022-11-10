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
   
## Endpoints

### Subscribe a Customer to a Tea Subscription 
- `post "/api/v1/subscriptions"`
