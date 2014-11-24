class Order

  attr_reader :order_number, :customer, :customer_number, :line_items, :total

  def initialize(order_number, customer)
    @order_number = order_number
    @customer = customer
    @customer_telephone_number = customer.telephone_number
    @line_items = []
    @total = 0
  end

  def add(line_item)
    @line_items << line_item
    @total += line_item.line_total
  end

end