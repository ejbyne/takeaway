class Customer

  attr_reader :name, :number

  def initialize(name, number)
    @name = name
    @number = number
  end

  def select_item(order, line_item)
    order.add(line_item)
  end

  def finish(order)
    order.complete
  end

end