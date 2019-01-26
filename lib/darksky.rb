require 'httparty'
require 'json'

# Wrapper for DarkSky weather api
class DarkSky

  def initialize(api_token)
    @api_token = api_token
    @base_url = 'https://api.darksky.net/forecast'
  end

  def get_forecast(lat, long)
    url = "#{@base_url}/#{@api_token}/#{lat},#{long}"
    response = HTTParty.get(url)
    return nil if !response || !response.body
    parsed = JSON.parse(response.body)
    parsed['currently']
  end

end
