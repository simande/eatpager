class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :foursquare_venue_id
      t.string :url
      t.integer :likes, :default => 0
      t.integer :dislikes, :default => 0

      t.timestamps
    end
  end
end
