require 'twilio-ruby'

account_sid = 'ACad80ea2ae6c26b3be7e64f2c6f638467'
auth_token = '4858f7127339fb76aefdaf78d2bc045c'
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.messages.create(:body => "Yo, this is your first Twilio message :)",
    :to => "+447515146965",     # Replace with your phone number
    :from => "+442071838750")   # Replace with your Twilio number
puts message.to