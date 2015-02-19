require 'spec_helper'
require 'takeaway'

describe Takeaway do

  let (:takeaway) { Takeaway.new(menu) }
  let (:dish) { double :dish, name: :chicken_jalfrezi }
  let (:menu) { double :menu, dishes: [dish] }
  let (:line_item) { double :line_item, dish_name: :chicken_jalfrezi }
  let (:order) { double :order, total: 7, line_items: [line_item] }
  let (:customer) { double :customer, telephone_number: '+441234567890' }
  let (:client) { double :client, messages: messages }
  let (:messages) { double :messages }

  it "should be able to receive an order if the payment amount is correct" do
    allow(takeaway).to receive(:send_message) # stubs out send_message method
    takeaway.receive(order, 7)
    expect(takeaway.orders).to eq([order])
  end

  it "should raise an error if the takeaway menu does not include an ordered dish" do
    incorrect_line_item = double :line_item, dish_name: :lamb_rogan_josh
    incorrect_order = double :order, total: 7, line_items: [incorrect_line_item]
    expect(lambda { takeaway.receive(incorrect_order, 7) }).to raise_error("One or more items is unavailable")
  end

  it "should raise an error if the payment amount does not equal the order total" do
    expect(lambda { takeaway.receive(order, 6) }).to raise_error("Incorrect payment amount")
  end

  it "should be able to send a confirmation text message" do
    expect(messages).to receive(:create)
    takeaway.send_message('+441234567890', client)
  end

end