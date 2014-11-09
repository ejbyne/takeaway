require 'dish'

describe Dish do

  let (:dish) { Dish.new(:chicken_jalfrezi, 7) }
  
  it "should be initialized with a name" do
    expect(dish.name).to eq(:chicken_jalfrezi)
  end

  it "should be initialized with a price" do
    expect(dish.price).to eq(7)
  end

end