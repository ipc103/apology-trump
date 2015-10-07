=begin
Let's build a small app that uses the Twitter API!
1) Go to apps.twitter.com and log-in (!handle? sign up!)
2) Create a new application and 
3) In the CLI: 'gem install twitter' and 'gem install pry'
=end

require 'twitter'
require 'pry'

#time for documentation
client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ""
  config.consumer_secret     = ""
  config.access_token        = ""
  config.access_token_secret = ""
end

binding.pry

