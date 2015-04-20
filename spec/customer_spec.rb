require 'customer'

describe Customer do

  it "has a name and number when created" do
    customer = described_class.new "Massud", "07515146965"
    expect(customer.name).to eq "Massud"
    expect(customer.number).to eq "07515146965"
  end

  it "can make an order" do
    customer = described_class.new "Massud", "07515146965"
    expect(customer.order({ burger: 2, chips: 1 }, 8)).to eq "Order placed"
  end
  it "can receive a confirmation" do
    customer = described_class.new "Massud", "07515146965"
    order = double :order, :text => customer.confirmation = ("Thank you, Massud") # rubocop: disable all
    # order = double :order
    # allow(order).to receive(:text) { customer.confirmation = "x x, Massud" }
    # another way to do above
    order.text
    expect(customer.confirmation).to eq "Thank you, Massud"
  end
end