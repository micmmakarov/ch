class AddPlaceToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :place_id, :integer
  end
end
