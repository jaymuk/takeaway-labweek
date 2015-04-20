class Menu

  attr_reader :list, :display

  def initialize
    @list = { burger: 3, chips: 2 }
  end

  def display
    display = @list.map { |item, price| "#{item}: £#{price}" }
    p display
    display[0] + ", " + display[1]
  end

end