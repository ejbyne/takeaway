class Takeaway

  attr_reader :orders

  def initialize
    @orders = []
  end

  def receive(order, payment_amount)
    raise "Incorrect payment amount" if order.total != payment_amount
    @orders << order
  end

  # def send(message, customer)
  
  # end


end