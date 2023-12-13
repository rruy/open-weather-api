require 'rails_helper'
require_relative '../../app/jobs/twitter_job'

RSpec.describe TwitterJob, type: :job do
  let(:twitter_service_instance) { instance_double('TwitterService') }

  before do
    allow(TwitterService).to receive(:new).and_return(twitter_service_instance)
  end

  describe '#perform' do
    it 'calls the specified action on TwitterService with the correct arguments' do
      allow(twitter_service_instance).to receive(:post).with('arg1')

      TwitterJob.perform_now(:post, 'arg1')

      expect(twitter_service_instance).to have_received(:post).with('arg1')
    end
  end
end