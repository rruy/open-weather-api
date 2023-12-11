class ApiController < ApplicationController
  def index
    render json: { message: 'Welcome to your API!' }
  end

  def show
    render json: { message: 'Show action' }
  end
end
