require 'menu'

describe Menu do

  it 'has a list of menu items' do
    menu = described_class.new
    expect(menu.list).to include(burger: 3, chips: 2)
  end

  it 'can display its menu items' do
    menu = described_class.new
    expect(menu.display).to eq "burger: £3, chips: £2"
  end

end