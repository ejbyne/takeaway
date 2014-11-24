require 'customer'

describe Customer do
  
  let (:customer) { Customer.new("Ed", "+441234567890") }
  let (:order) { double :order }
  let (:line_item) { double :line_item, dish: "chicken jalfrezi", quantity: 1 }
  let (:takeaway) { double :takeaway }

  it "must be created with a name" do
    expect(customer.name).to eq("Ed")
  end

  it "must be created with a telephone number" do
    expect(customer.telephone_number).to eq("+441234567890")
  end

end