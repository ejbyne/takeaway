class Takeaway

  require 'twilio-ruby'

  TWILIO_ACCOUNT_SID = ENV['TWILIO_ACCOUNT_SID']
  TWILIO_AUTH_TOKEN = ENV['TWILIO_AUTH_TOKEN']
  TWILIO_NUMBER = ENV['TWILIO_NUMBER']
  MY_NUMBER = ENV['MY_NUMBER']
  CLIENT = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN

  attr_reader :orders

  def initialize(menu)
    @menu = menu
    @orders = []
  end

  def receive(order, payment_amount)
    raise "One or more items is unavailable" unless items_available?(order)
    raise "Incorrect payment amount" unless payment_correct?(order, payment_amount)
    @orders << order
    self.send_message(MY_NUMBER)
    # using my mobile number for test purposes
    # self.send_message(order.customer_telephone_number)
    # would use customer telephone number for production version
  end

  def items_available?(order)
    @menu.dishes.map(&:name) & order.line_items.map(&:dish_name) == order.line_items.map(&:dish_name)
  end

  def payment_correct?(order, payment_amount)
    order.total == payment_amount
  end

  def send_message(customer_telephone_number, client = CLIENT)
    delivery_time = Time.now + 3600
    client.messages.create(
      :from => TWILIO_NUMBER,
      :to => customer_telephone_number,
      :body => "Thank you! Your order was placed and will be delivered before #{delivery_time.hour}:#{delivery_time.min}"
    )
  end

end