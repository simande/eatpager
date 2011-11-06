class PhotosController < ApplicationController
  def update
    p = Photo.where("url = ?", params[:image]).first
    if params[:preference] == "like"
      p.likes = p.likes + 1
    elsif params[:preference] == "dislike"
      p.dislikes = p.dislikes + 1
    end
    p.save
    head :ok
  end
end