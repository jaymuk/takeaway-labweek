require 'order'

describe Order do
  let(:customer) { double :customer, name: "Massud", number: "7515146965", meal: { burger: 2, chips: 1 }, total: 8, :confirmation= => nil } # rubocop: disable all

  it "can receive customers information" do
    order = described_class.new customer
    expect(order.name).to eq "Massud"
    expect(order.number).to eq "7515146965"
    expect(order.meal).to include(burger: 2, chips: 1)
  end

  it 'can send customer confirmation text' do
    order = described_class.new customer
    order.text
    allow(customer).to receive(:confirmation).and_return 'Thank you, Massud'
    expect(customer.confirmation).to eq 'Thank you, Massud'
  end

  it 'raises error if customer gives wrong total' do
    menu = double :menu, list: { burger: 3, chips: 2 }
    aloof_customer_order = { burger: 3, chips: 2 }
    aloof_customer = double :aloof_customer, total: 10, meal: aloof_customer_order
    order = described_class.new aloof_customer
    expect { order.check_total menu }.to raise_error 'Wrong total'
  end
end