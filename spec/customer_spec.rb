require 'customer'

describe Customer do
  
  let (:customer) { Customer.new("Ed", "01234 567890") }
  let (:order) { double :order }
  let (:line_item) { double :line_item, dish: "chicken jalfrezi", quantity: 1 }
  let (:takeaway) { double :takeaway }

  it "must be created with a name" do
    expect(customer.name).to eq("Ed")
  end

  it "must be created with a number" do
    expect(customer.number).to eq("01234 567890")
  end

  it "must be able to add a line item to an order" do
    expect(order).to receive(:add).with(line_item)
    allow(order).to receive(:total)
    customer.select_item(order, line_item)
  end

  it "must be able to finish an order" do
    expect(takeaway).to receive(:receive)
    allow(order).to receive(:total)
    customer.submit(order, takeaway)
  end

end