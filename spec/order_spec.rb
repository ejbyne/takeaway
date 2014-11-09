require 'order'
 
describe Order do

  let (:order) { Order.new(20) }
  let (:line_item) { double :line_item, line_total: 7  }
  let (:line_item2) { double :line_item, line_total: 6 }
  let (:takeaway) { double :takeaway }
  
  it "should allow a line item to be added" do
    order.add(line_item)
    expect(order.line_items).to eq([line_item])
  end

  it "should keep a running total" do
    order.add(line_item)
    order.add(line_item2)
    expect(order.total).to eq(13)
  end

end