class PhotosController < ApplicationController
  def update
    # p = Photo.where("foursquare_venue_id = ?", params[:foursquare_venue_id]).first
    # if params[:preference] == "like"
    #   p.likes = p.likes + 1
    # elsif params[:preference] == "dislike"
    #   p.dislikes = p.dislikes + 1
    # end
    head :ok
  end
end