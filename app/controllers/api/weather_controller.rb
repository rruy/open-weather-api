require_relative '../../jobs/twitter_job'

class Api::WeatherController < ApiController
  skip_before_action :verify_authenticity_token, only: [:create]

  def index
    render json: { message: 'Welcome API Weather Forecast!' }
  end

  def create
    forecast = OpenWeatherSdk.call('3b839e5f779bb4cc9605b08f05253905', city_param["name"])

    TwitterJob.perform_later(:post, forecast)

    render json: { forecast: forecast }
  end

  private

  def city_param
    params.require(:city).permit(:name)
  end
end
