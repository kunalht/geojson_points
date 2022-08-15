require 'sinatra'
require 'sinatra/activerecord'
require 'pg'
require 'json'

before do
  content_type :json
end

post '/geo_points' do
  data = JSON.parse request.body.read
  sql = "INSERT INTO geo_points(location) values (ST_GeomFromGeoJSON(#{data}));"
  result = ActiveRecord::Base.connection.execute(sql)
  result.values.to_json
end

get '/geo_points_around_point' do
  unit = params['unit']
  distance = params['distance']
  longitude = params['longitude']
  latitude = params['latitude']

  if longitude.nil? || latitude.nil? || distance.nil?
    return "Please provide Longitude, Latitude and Distance"
  end

  # If unit is in feet, conver it to meters
  if unit == 'feet'
    distance = (distance.to_f)/3.28
  end

  sql = "SELECT ST_AsText(location) FROM geo_points WHERE ST_DWithin(location::geography, ST_SetSRID(ST_MakePoint(#{longitude},#{latitude}),4326)::geography, #{distance})"
  result = ActiveRecord::Base.connection.execute(sql)
  result.values.to_json
end

get '/geo_points_within_polygon' do 
  data = JSON.parse request.body.read
  puts data
  sql = "SELECT ST_AsText(location) FROM geo_points WHERE ST_Within(location::geography, ST_SetSRID(ST_MakePolygon()"
  result = ActiveRecord::Base.connection.execute(sql)
  result.values.to_json
end
