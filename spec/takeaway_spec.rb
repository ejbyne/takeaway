require 'takeaway'

describe Takeaway do

  let (:takeaway) { Takeaway.new }
  let (:order) { double :order, total: 7 }
  let (:customer) { double :customer, number: '+441234567890' }

  it "should be able to receive an order if the payment amount is correct" do
    takeaway.receive(order, 7)
    expect(takeaway.orders).to eq([order])
  end

  it "should raise an error if the payment amount does not equal the order total" do
    expect(lambda { takeaway.receive(order, 6) }).to raise_error(RuntimeError)
  end

  it "should be able to send a confirmation message to customer" do
    allow(order).to receive(:customer_telephone_number)
  end


end