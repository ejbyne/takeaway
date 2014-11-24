class Takeaway

  require 'twilio-ruby'

  TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  TWILIO_NUMBER = ENV['TWILIO_NUMBER']
  MY_NUMBER = ENV['MY_NUMBER']

  attr_reader :orders

  def initialize
    @orders = []
  end

  def receive(order, payment_amount)
    raise "Incorrect payment amount" if order.total != payment_amount
    @orders << order
    self.send_message(MY_NUMBER)
    # using my mobile number for test purposes
    # self.send_message(order.customer_telephone_number)
    # using customer telephone number for production version
  end

  def send_message(customer_telephone_number)
    delivery_time = Time.now + 3600
    @client = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN
    @client.messages.create(
        :from => TWILIO_NUMBER,
        :to => customer_telephone_number,
        :body => "Thank you! Your order was placed and will be delivered before #{delivery_time.hour}:#{delivery_time.min}"
      )
  end

end