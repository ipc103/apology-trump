=begin
Understanding APIs
What are they? What does that acronym actually mean?
Are they somehow related to what we've been building in Sinatra?
What are some examples of people using them?

Let's build a small app that uses the Twitter API!
1) Go to apps.twitter.com and log-in (!handle? sign up!)
2) 
3) In the CLI: 'gem install twitter'
4)
=end
require 'Twitter'

client = Twitter::REST::Client.new do |config|
  #woa, wait second, what is this stuff? REST?! like a nap?
  #REST is a type of architecture on the web - THE architecture
  
end

