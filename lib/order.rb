require 'twilio-ruby'

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
    send_sms
    @customer.confirmation = 'Thank you, Massud'
  end

  def send_sms
    account_sid = 'ACad80ea2ae6c26b3be7e64f2c6f638467'
    auth_token = '4858f7127339fb76aefdaf78d2bc045c'
    @client = Twilio::REST::Client.new account_sid, auth_token
 
    message = @client.account.messages.create(:body => "Thank you, Massud",
    :to => "+44#{@customer.number}",
    :from => "+442071838750")
    puts message.to
  end

  def check_total(menu)
    menu_total = 0

    @customer.meal.map do |meal, quantity|
      menu_total += quantity * menu.list[meal]
    end

    fail 'Wrong total' if @customer.total != menu_total
  end

end