This project aims to develop a functional website for laundromat/dry-cleaner owners with a delivery/drop-off service.
* Set Up *
Run bundle 
Run rackup

* Website Guide *

quick login as admin: 
  email: admin@admin.com, password: pass 
  
quick login as customer: 
  email: customer@customer.com, password: pass  

  The delivery and drop-off process:
    A customer schedules a pickup.
    The admin can view all requests for pickup.
    The laundromat sends someone to pick up the customer's clothing on the requested pick-up date.
    The admin then creates an order through the request page with the weight and price information.
    The customer sees the order in their "current orders" section, and their request is now deleted.
    After the clothes have been cleaned, the laundromat drops the clothes off.
    The admin can see all orders, and notes the order as dropped off.
    The order moves from the admin's current orders to past orders.
    The order moves from the customer's current orders to their order history.



*Extras*

Create an admin through the database (this account will be used by the business).
  rake console or tux in terminal.
  User.create(name: your_name, email: your_email, password: your_password, admin: true)
