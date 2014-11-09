require 'line_item'

describe LineItem do 

  let (:line_item) { LineItem.new(dish, 2) }
  let (:dish) { double :dish, name: :chicken_jalfrezi, price: 7 }

  it "should be initialized with a specific dish" do 
    expect(line_item.dish_name).to be(:chicken_jalfrezi)
  end

  it "should be initialized with a dish price" do
    expect(line_item.dish_price).to be(7)
  end

  it "should be initialized with a quantity" do
    expect(line_item.quantity).to be(2)
  end

  it "should be initialized with a line total" do
    expect(line_item.line_total).to be (14)
  end

end