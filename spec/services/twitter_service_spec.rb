require 'rails_helper'
require_relative '../../app/services/twitter_service'

RSpec.describe TwitterService, type: :service do
  describe '#get_tweets' do
    it 'returns tweets' do
      client_double = instance_double(Twitter::REST::Client)
      allow(Twitter::REST::Client).to receive(:new).and_return(client_double)
      allow(client_double).to receive(:user_timeline).and_return([double('tweet', text: 'Hello, Twitter!')])

      twitter_service = TwitterService.new
      tweets = twitter_service.get_tweets('example_user')

      expect(tweets).to be_an(Array)
      expect(tweets.first).to include('text' => 'Hello, Twitter!')
    end
  end

  describe '#post' do
    it 'posts a tweet' do
      tweet = Twitter::Tweet.new(id: 123, text: 'Hello, Twitter!')
      client_double = instance_double(Twitter::REST::Client)
      allow(Twitter::REST::Client).to receive(:new).and_return(client_double)
      allow(client_double).to receive(:update).and_return(tweet)

      twitter_service = TwitterService.new
      result = twitter_service.post('Hello, Twitter!')

      expect(result).to be_an_instance_of(Twitter::Tweet)
      expect(result.text).to eq('Hello, Twitter!')
    end
  end
end