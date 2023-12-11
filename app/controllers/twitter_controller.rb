class ApiController < ApiController
  def index
    render json: { message: 'Welcome to your API!' }
  end

  def show
    client = Twitter::REST::Client.new do |config|
      config.consumer_key    = "YOUR_CONSUMER_KEY"
      config.consumer_secret = "YOUR_CONSUMER_SECRET"
    end

    client.update("Teste 123")

    render json: { message: 'Show action' }
  end
end



