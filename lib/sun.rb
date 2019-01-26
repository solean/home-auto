require 'httparty'
require 'json'

# Wrapper for sunrise/sunset api
class Sun
  def initialize(latitude, longitude)
    @base_url = 'https://api.sunrise-sunset.org/json'
    @latitude = latitude
    @longitude = longitude
  end

  def get_sunset_data(date='today')
    url = "#{@base_url}?lat=#{@latitude}&lng=#{@longitude}&date=#{date}"
    response = HTTParty.get(url)
    return nil if !response || !response.body
    parsed = JSON.parse(response.body)
    parsed['results']
  end

  def sunset_time
    data = get_sunset_data
    sunset_time_str = data['sunset']
    return nil unless sunset_time_str

    time = DateTime.strptime(sunset_time_str, '%H:%M:%S %p').to_time
    time.localtime
  end
end
