require 'customer'

describe Customer do

  it "has a name when created" do
    customer = described_class.new "Massud"
    expect(customer.name).to eq "Massud"
  end
  it "can make an order" do
    customer = described_class.new "Massud"
    expect(customer.order({ burger: 2, chips: 1 }, "£8")).to eq "Order placed"
  end
  it "can receive a confirmation" do
    customer = described_class.new "Massud"
    order = double :order, :text => customer.confirmation = ("Thank you, Massud")
    # order = double :order
    #allow(order).to receive(:text) { customer.confirmation = "Thank you, Massud" } # another way to do above
    order.text
    expect(customer.confirmation).to eq "Thank you, Massud"
  end
end