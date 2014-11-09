require 'customer'

describe Customer do
  
  let (:customer) { Customer.new("Ed", "01234 567890") }
  let (:order) { double :order }
  let (:line_item) { double :line_item, dish: "chicken jalfrezi", quantity: 1 }

  it "must be created with a name" do
    expect(customer.name).to eq("Ed")
  end

  it "must be created with a number" do
    expect(customer.number).to eq("01234 567890")
  end

  it "must be able to add a line item to an order" do
    expect(order).to receive(:add).with(line_item)
    customer.select_item(order, line_item)
  end

  it "must be able to complete an order" do
    expect(order).to receive(:complete)
    customer.finish(order)
  end

end