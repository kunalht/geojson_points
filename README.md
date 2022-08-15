Start the application:

To start the application, run `bundle i` first and then `ruby app.rb`


API Documentation

1.  <a href="#create_geo_points"> POST '/geo_points' </a>
2.  <a href="#get_points_around_point"> GET '/geo_points_around_point' </a>
3.  <a href="#get_points_within_polygon"> GET '/geo_points_within_polygon' </a>


# create_geo_points

Creates new  geo points into the database

**Request**  

(GeoJSON format)
`type` : **String** *Required* Type (i.e. Point)

`coordinates`: **String** *Required*  [] (coordinates in latitude and longitude)

**Success Code**

`200`: Success

# get_points_around_point

Get points within certain radius of the given point

**Request** (query params)

`unit` : **String** Unit of distance (meter OR feet)

`longitude` : **String** *Required* Longitude (i.e. 50)

`latitude` : **String** *Required* Latitude (i.e. -80.20)

`distance` : **String** *Required* Distance in meters or feet (i.e. 5000)

**Success Code**

`200`: Success

# geo_points_within_polygon

