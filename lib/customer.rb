class Customer

  attr_reader :name, :meal, :total
  attr_accessor :confirmation

  def initialize name
    @name = name
  end

  def order(meal, total)
    @meal, @total = meal, total
    "Order placed"
  end

end
