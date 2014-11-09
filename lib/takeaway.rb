class Takeaway

  attr_reader :orders

  def initialize
    @orders = []
  end

  def receive(order)
    @orders << order
  end

  # def send(message, customer)
  
  # end


end