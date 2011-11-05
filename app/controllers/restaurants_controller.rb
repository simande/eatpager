class RestaurantsController < ApplicationController
  def show
    foursquare = Foursquare::Base.new("EGX1V4A5EHISQ30EDJIDLGGQOUZI3P0YU0JNHX51HPXO4WK1", "FIFIECB500LECVJVUNOISZ0O435AWCJFPFBCA2GBPPCXFOUG")
    geo = Geokit::Geocoders::GoogleGeocoder.geocode(params[:location])
    # puts geo
    latlng = geo.lat.to_s + ", " + geo.lng.to_s
    # latlng = params[:location] || "40.7099537,-73.9624357"
    page = params[:page].to_i || 0
    
    nearby = foursquare.venues.nearby(:ll => latlng, :category_id => "4d4b7105d754a06374d81259", :radius => 800)
    page = page % nearby.length
    
    @restaurant = nearby[page]
    
    @testleng = nearby.length
    
    @grade = OpenData.where('phone = ? and grade <> ?', @restaurant.contact["phone"], '').first.grade
    
    # puts latlng
    
    # puts Geokit::Geocoders::GoogleGeocoder.geocode('10013').lat
    
    
    # @restaurant = foursquare.venues.find(params[:id])
    
    # @nearby = foursquare.venues.nearby(:ll => "40.7236307,-73.9999479", :category_id => "4d4b7105d754a06374d81259")
    # category_id 4d4b7105d754a06374d81259 is food
  end
end