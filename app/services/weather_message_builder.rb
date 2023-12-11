class WeatherMessageBuilder
  def initialize(temperature, conditions, city, date, forecast)
    @temperature = temperature
    @conditions = conditions
    @city = city
    @date = date
    @forecast = forecast
  end

  def build_message
    message = "#{@temperature}°C e #{@conditions} em #{@city} em #{@date}."
    message += " Média para os próximos dias: #{build_forecast}."
    message
  end

  private

  def build_forecast
    @forecast.map { |day| "#{day[:temperature]}°C em #{day[:date]}" }.join(', ')
  end
end
