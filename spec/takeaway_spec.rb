require 'takeaway'

describe Takeaway do

  let (:takeaway) { Takeaway.new }
  let (:order) { double :order }

  it "should be able to receive an order" do
    takeaway.receive(order)
    expect(takeaway.orders).to eq([order])
  end

  xit "should be able to send a confirmation message to customer" do

  end


end