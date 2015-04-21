class Customer

  attr_reader :name, :number, :meal, :total
  attr_accessor :confirmation

  def initialize name, number
    @name = name
    @number = number
  end

  def order(meal, total) #meal is a k-v pair of item and quantity
    @meal, @total = meal, total
    "Order placed"
  end

end
