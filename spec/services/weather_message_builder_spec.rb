require 'rails_helper'
require 'weather_message_builder'

RSpec.describe WeatherMessageBuilder do
  describe '#build_message' do
    it 'builds a weather message' do
      forecast_data = [
        { temperature: 32, date: '13/12' },
        { temperature: 25, date: '14/12' },
        { temperature: 29, date: '15/12' },
        { temperature: 33, date: '16/12' },
        { temperature: 28, date: '16/12' }
      ]

      builder = WeatherMessageBuilder.new(34, 'nublado', 'cidade', '12/12', forecast_data)
      message = builder.build_message

      expected_message = '34°C e nublado em cidade em 12/12. Média para os próximos dias: 32°C em 13/12, 25°C em 14/12, 29°C em 15/12, 33°C em 16/12, 28°C em 16/12.'
      expect(message).to eq(expected_message)
    end
  end
end
