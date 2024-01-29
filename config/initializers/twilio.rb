# config/initializers/twilio.rb
require 'twilio-ruby'

Twilio.configure do |config|
  config.account_sid =  "ACfc161a62cff7271d886d97f907950d72" 
  config.auth_token = 'b3a6cccf184b979c951d330a03f943cc'
end
