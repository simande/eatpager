class RestaurantsController < ApplicationController
<<<<<<< HEAD
end
=======
  def show
    foursquare = Foursquare::Base.new("EGX1V4A5EHISQ30EDJIDLGGQOUZI3P0YU0JNHX51HPXO4WK1", "FIFIECB500LECVJVUNOISZ0O435AWCJFPFBCA2GBPPCXFOUG")
    @v = foursquare.venues.find(params[:id])
  end
end
>>>>>>> c1cf3edb335e8c0c8475ea579824bc16a3771fa9
