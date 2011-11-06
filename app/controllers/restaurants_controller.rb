class RestaurantsController < ApplicationController
  require "ordrin"
  
  def show
    foursquare = Foursquare::Base.new("EGX1V4A5EHISQ30EDJIDLGGQOUZI3P0YU0JNHX51HPXO4WK1", "FIFIECB500LECVJVUNOISZ0O435AWCJFPFBCA2GBPPCXFOUG")
    geo = Geokit::Geocoders::GoogleGeocoder.geocode(params[:location])
    latlng = geo.lat.to_s + "," + geo.lng.to_s
    # latlng = "40.7257565,-73.9946459"
    
    page = params[:page].to_i || 0
    
    nearby = foursquare.venues.nearby(:ll => latlng, :category_id => "4d4b7105d754a06374d81259", :radius => 160)
    page = page % nearby.length
    
    @restaurant = foursquare.venues.find(nearby[page].id)
    
    @distance_away = geo.distance_from(@restaurant.location.lat.to_s + "," + @restaurant.location.lng.to_s)
    
    OrdrIn::API.new("KtdDpAMI4RGuIUxbu8bTaA", "http://localhost:3000") # developer key and site where hosted
    place = OrdrIn::Address.new("1 Main St", "College Station", "77840", "Suite 200", "Texas", "4044099661", "Home") # street, city, zip, street2, state, phone, nickname
    puts place
    
    open_data = OpenData.where('phone = ? and grade <> ?', @restaurant.contact["phone"], '').first
    
    if open_data.blank?
      @grade, @violation = 'N/A', 'N/A'
    else
      @grade, @violation = open_data.grade, open_data.violation
    end
    
    # puts latlng
  end
end