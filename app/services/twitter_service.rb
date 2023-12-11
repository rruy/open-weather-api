require 'yaml'

class TwitterService
  def initialize
    keys = load_keys
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = keys['consumer_key']
      config.consumer_secret     = keys['consumer_secret']
      config.access_token        = keys['access_token']
      config.access_token_secret = keys['access_token_secret']
    end
  end

  def get_tweets(username)
    @client.user_timeline(username).map { |tweet| { 'text' => tweet.text } }
  end

  def post(message)
    @client.update(message)
  end

  private

  def load_keys
    env = ENV['RAILS_ENV'] || 'development'
    config_file_path = Rails.root.join('config', 'twitter.yml')
    config = YAML.safe_load(File.read(config_file_path))[env]
    raise 'Twitter API keys not found in the configuration file.' unless config

    config
  end
end
