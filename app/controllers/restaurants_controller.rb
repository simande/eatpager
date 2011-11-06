class RestaurantsController < ApplicationController
  require 'net/https'
  require 'uri'
  require 'json'
  
  def index
    render :layout => false
  end
  
  def show
    foursquare = Foursquare::Base.new("EGX1V4A5EHISQ30EDJIDLGGQOUZI3P0YU0JNHX51HPXO4WK1", "FIFIECB500LECVJVUNOISZ0O435AWCJFPFBCA2GBPPCXFOUG")
    geo = Geokit::Geocoders::GoogleGeocoder.geocode(params[:location])
    @origin = geo.lat.to_s + "," + geo.lng.to_s
    # latlng = "40.7257565,-73.9946459"
    page = params[:page].to_i || 0
    
    nearby = foursquare.venues.nearby(:ll => @origin, :category_id => "4d4b7105d754a06374d81259", :radius => 240)
    page = page % nearby.length
    
    @restaurant = foursquare.venues.find(nearby[page].id)
    #puts @restaurant.categories.inspect
    
    @destination = @restaurant.location.lat.to_s + "," + @restaurant.location.lng.to_s
    @distance_away = geo.distance_from(@destination)
    if Photo.where("foursquare_venue_id = ?", @restaurant.id).count == 0
      @restaurant.all_photos.each do |p|
        Photo.create(:foursquare_venue_id => @restaurant.id, :url => p.url)
      end
    end
    
    @photos = Photo.where("foursquare_venue_id = ?", @restaurant.id).order("likes DESC, dislikes ASC")
    
    open_data = OpenData.where('phone = ? and grade <> ?', @restaurant.contact["phone"], '').first
    
    if open_data.blank?
      @grade, @violations = 'N/A', ['N/A']
    else
      @grade, @violations = open_data.grade, open_data.violation.split('; ')
    end
    
    @minute_walk = (@distance_away / 5) * 60
      
    # uri = URI.parse("https://maps.googleapis.com/maps/api/directions/json?origin=#{@origin}&destination=#{@destination}&sensor=false&mode=walking")
    # http = Net::HTTP.new(uri.host, uri.port)
    # http.use_ssl = true
    # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    # 
    # request = Net::HTTP::Get.new(uri.request_uri)
    # 
    # response = http.request(request).body.force_encoding('utf-8')
    # json = ActiveSupport::JSON.decode(response)
    # puts json
    # seconds = json['routes'][0]['legs'][0]['duration']['value']
    # @minute_walk = Time.at(seconds).strftime('%M')
    
    #@minute_walk = ''
    # puts latlng
    
    # puts Geokit::Geocoders::GoogleGeocoder.geocode('10013').lat    
    # puts latlng
  end
end