class Order

  attr_reader :order_number, :line_items, :total

  def initialize(order_number)
    @order_number = order_number
    @line_items = []
    @total = 0
  end

  def add(line_item)
    @line_items << line_item
    @total += line_item.line_total
  end

end