class Customer

  attr_reader :name, :telephone_number

  def initialize(name, telephone_number)
    @name = name
    @telephone_number = telephone_number
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