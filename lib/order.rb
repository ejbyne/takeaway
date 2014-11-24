class Order

  attr_reader :order_number, :customer, :line_items, :total #, :customer_telephone_number

  def initialize(order_number, customer)
    @order_number = order_number
    @customer = customer
    # @customer_telephone_number = customer.telephone_number
    # telephone number only needed for production version
    @line_items = []
    @total = 0
  end

  def add(line_item)
    @line_items << line_item
    @total += line_item.line_total
  end

end