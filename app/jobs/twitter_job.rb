require_relative '../services/twitter_service'

class TwitterJob < ApplicationJob
  queue_as :default

  def perform(action, *args)
    TwitterService.new.send(action, *args)
  end
end
