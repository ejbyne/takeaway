class LineItem

  attr_reader :dish_name, :dish_price, :quantity, :line_total

  def initialize(dish, quantity)
    @dish_name = dish.name
    @dish_price = dish.price
    @quantity = quantity
    @line_total = @dish_price * @quantity
  end
  
end