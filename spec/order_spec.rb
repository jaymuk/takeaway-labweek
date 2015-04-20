require 'order'

describe Order do
  let(:customer) { double :customer, name: "Massud", number: "07515146965", meal: { burger: 3, chips: 2 }, total: 8, :confirmation= => nil } # rubocop: disable all

  it "can receive customers information" do
    order = described_class.new customer
    expect(order.name).to eq "Massud"
    expect(order.number).to eq "07515146965"
    p customer.meal
    expect(order.meal).to include(burger: 3, chips: 2)
  end

  it 'can send customer confirmation text' do
    order = described_class.new customer
    order.text
    allow(customer).to receive(:confirmation).and_return 'Thank you, Massud'
    expect(customer.confirmation).to eq 'Thank you, Massud'
  end

  it 'raises error if customer gives wrong total' do
    order = described_class.new customer
    aloof_customer = double :customer, order: :meal => ({ burger: 3, chips: 2 }, total: 8)
  end

end