class RestaurantsController < ApplicationController
  def show
    foursquare = Foursquare::Base.new("EGX1V4A5EHISQ30EDJIDLGGQOUZI3P0YU0JNHX51HPXO4WK1", "FIFIECB500LECVJVUNOISZ0O435AWCJFPFBCA2GBPPCXFOUG")
    @restaurant = foursquare.venues.find(params[:id])
    # @tips = foursquare.get("venues/#{params[:id]}/tips")["tips"]["items"]
    # @nearby = foursquare.venues.nearby(:ll => "40.7236307,-73.9999479", :category_id => "4d4b7105d754a06374d81259")
    # category_id 4d4b7105d754a06374d81259 is food
  end
end
