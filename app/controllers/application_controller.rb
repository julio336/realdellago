class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_tweets

  def load_tweets
    account = "hrealdelago"
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "MkYi53JY8meo9eKJwOOKfZ0GR"
      config.consumer_secret     = "sx8KYQhSuJQNlGf58wHoWT5XbsjZE1Nk68EsEkpUeH0gGNnAAj"
      config.access_token        = "580490259-9A9jZggowwKvw7H7JuMBPc1QWTFs1mlgQGdslWu9"
      config.access_token_secret = "rZmPaE5VNVyMXxDT1fm6IAXoWsXo9AWAhFXPLe0SEaMF5"
    end
    @twitter_user = account
    @tweet_news = client.user_timeline(@twitter_user, {count: 2})
  end

end