require 'twitter_ebooks'

# This is an example bot definition with event handlers commented out
# You can define and instantiate as many bots as you like

class MyBot < Ebooks::Bot
  # Configuration here applies to all MyBots
  def configure
    # Consumer details come from registering an app at https://dev.twitter.com/
    # Once you have consumer details, use "ebooks auth" for new access tokens
    self.consumer_key = 'lUzVAsAFQSNM2J7JGUeJtKUFy' # Your app consumer key
    self.consumer_secret = 'W2txxOMuGHEuOPwX1K5AtzhrkuwEMfMGjbZn2FYFsigN2myUKl' # Your app consumer secret

    # Users to block instead of interacting with
    self.blacklist = ['tnietzschequote']

    # Range in seconds to randomize delay when bot.delay is called
    self.delay_range = 1..6
  end

  def on_startup
    scheduler.every '24h' do
      # Tweet something every 24 hours
      # See https://github.com/jmettraux/rufus-scheduler
      # tweet("hi")
      # pictweet("hi", "cuteselfie.jpg")
    end
scheduler.every '1h' do
model = Ebooks::Model.load("model/jaranjaro.model")
      statement = model.make_statement(140)
      tweet(statement)
    end

  end

  def on_message(dm)
    # Reply to a DM
    # reply(dm, "secret secrets")
  end

  def on_follow(user)
    # Follow a user back
    # follow(user.screen_name)
  end

  def on_mention(tweet)
    # Reply to a mention
model = Ebooks::Model.load("model/jaranjaro.model")
statement = model.make_statement(120)
   reply(tweet, statement)
  end

  def on_timeline(tweet)
    # Reply to a tweet in the bots timeline
    # reply(tweet, "nice tweet")
  end

  def on_favorite(user, tweet)
    # Follow user who just favorited bot's tweet
    # follow(user.screen_name)
  end

  def on_retweet(tweet)
    # Follow user who just retweeted bot's tweet
    # follow(tweet.user.screen_name)
  end

end

# Make a MyBot and attach it to an account
MyBot.new("sahalgorithm") do |bot|
  bot.access_token = "776970340274671616-TlYZ83u4U8LEQeCTM25QuaCcx1rzleb" # Token connecting the app to this account
  bot.access_token_secret = "3uCYllwhFsRWGfyHxEpAfCJOarhR06J2tkjt8gClWKENf" # Secret connecting the app to this account

end
