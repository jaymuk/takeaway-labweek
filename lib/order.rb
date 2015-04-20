class Order

  def initialize customer
    @customer = customer
  end

  def name
    @customer.name
  end

  def number
    @customer.number
  end

  def meal
    @customer.meal
  end

  def text
    @customer.confirmation = 'Thank you, Massud'
  end

end