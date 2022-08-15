require 'my_sinatra_app'
require 'minitest/autorun'
require 'rack/test'

class MyAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def get_geo_points_around_points
    get '/geo_points_around_point?longitude=-48.23456&latitude=20.12343&distance=50000'
    assert_equal '', last_response.body
  end
end