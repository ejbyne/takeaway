class Customer

  attr_reader :name, :number

  def initialize(name, number)
    @name = name
    @number = number
  end

  def select_item(order, line_item)
    order.add(line_item)
    return order.total
  end

  def submit(takeaway, order, payment_amount)
    takeaway.receive(order, payment_amount)
    return order.total
  end

end