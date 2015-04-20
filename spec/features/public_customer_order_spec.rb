feature "Customer makes an order" do
  scenario "from a menu" do
    customer = Customer.new "Massud"
    menu = Menu.new
    order = Order.new customer
    expect(menu.display).to eq "burger: £3, chips: £2"
    customer.order({ burger: 2, chips: 1 }, "£8")
    order.text
    expect(customer.confirmation).to eq "Thank you, Massud"
  end
end