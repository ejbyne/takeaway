class Takeaway

  require 'twilio-ruby'
  attr_reader :orders

  def initialize
    @orders = []
  end

  def receive(order, payment_amount)
    raise "Incorrect payment amount" if order.total != payment_amount
    @orders << order
    # self.send_message(order.customer_telephone_number)
    self.send_message('+447896984333')
  end

  def send_message(customer_telephone_number)
    delivery_time = Time.now + 3600
    account_sid = 'AC4608cc0e9ba93088142097ca0b395c12'
    auth_token = '54f2acc0ee7e5a93fd37507d134a53fd'
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
        :from => '+441163262148',
        :to => customer_telephone_number,
        :body => "Thank you! Your order was placed and will be delivered before #{delivery_time.hour}:#{delivery_time.min}"
      )
  end

end