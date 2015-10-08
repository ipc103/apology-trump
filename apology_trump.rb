require 'bundler'
Bundler.require
Dotenv.load

class ApologyTrump

  APOLOGIES = ["Sorry for saying this", "I apologize for this remark", "My bad :(", "Oops, this won't be good", "I didn't mean this either, sorry", "This was wrong and I am sorry"]

  attr_reader :client

  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["CONSUMER_KEY"]
      config.consumer_secret = ENV["CONSUMER_SECRET"]
      config.access_token = ENV["ACCESS_TOKEN"]
      config.access_token_secret = ENV["ACCESS_TOKEN_SECRET"]
    end
  end

  def trump_tweets
    client.user_timeline("realDonaldTrump")
  end

  def trump_most_recent
    tweet = trump_tweets.find {|tweet| tweet.full_text[1] != "@"}
    tweet.full_text
  end

  def apologize
    tweet = apology_tweet(trump_most_recent)
    tweet = tweet[0..136] + "..." if tweet.length > 140
    client.update(tweet) unless already_tweeted?(tweet)
  end

  def apology_tweet(tweet_text)
    "#{APOLOGIES.sample} @realDonaldTrump: #{tweet_text}"
  end

  def user_timeline
    client.user_timeline
  end

  def most_recent
    client.user_timeline.first.full_text
  end

  def original_text(tweet)
    tweet.split("@realDonaldTrump:").last[0..30]
  end

  def already_tweeted?(tweet)
    original_text(tweet) == original_text(most_recent)
  end

end

ApologyTrump.new.apologize


