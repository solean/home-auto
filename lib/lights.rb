require 'hue'

class Lights
  def initialize
    @client = Hue::Client.new
    @lights = @client.lights
  end

  # brightness out of 255
  def set_brightness(brightness)
    @lights.each do |light|
      light.set_state({ :brightness => brightness})
    end
  end
end
