require 'rails_helper'

RSpec.describe Api::WeatherController, type: :controller do
  describe 'POST #create' do
    let(:forecast_result) { { 'temperature' => 25, 'conditions' => 'Sunny' } }

    before do
      allow(OpenWeatherSdk).to receive(:call).and_return(forecast_result)
      allow(TwitterJob).to receive(:perform_later)
    end

    it 'calls OpenWeatherSdk and enqueues TwitterJob' do
      post :create, params: { city: { name: 'Rio de Janeiro' } }

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq({ 'forecast' => forecast_result })
      expect(OpenWeatherSdk).to have_received(:call).with('3b839e5f779bb4cc9605b08f05253905', 'Rio de Janeiro')
      expect(TwitterJob).to have_received(:perform_later).with(:post, forecast_result)
    end
  end
end