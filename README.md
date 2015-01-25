# Takeaway

## Summary

I have written a takeaway order app in Ruby as part of my Week 2 challenge at Makers Academy. The app integrates the Twilio API for sending SMS order confirmations.

## Technologies Used

- Ruby
- Rspec
- Gems (Twilio)

## Job List

- List of dishes with prices
- Placing the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52"
- The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free
- Use twilio-ruby gem to access the API
- Use a Gemfile to manage your gems
- Make sure that your Takeaway class is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
- However, if your Takeaway class is loaded into IRB and the order is placed, the text should actually be sent
- A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone
- Push the solution to a Github repo called 'takeaway'

## Favourite Code Snippet

Solution for checking if ordered items are on the menu:
~~~
def items_available?(order)
  @menu.dishes.map(&:name) & order.line_items.map(&:dish_name) == order.line_items.map(&:dish_name)
end
~~~

## Takeaway

This was a good consolidation of the use of TDD and OOP, as well as an introduction to using gems and API functionality.