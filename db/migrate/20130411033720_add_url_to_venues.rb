class AddUrlToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :url, :string
    add_column :venues, :map_url, :string
    add_column :venues, :image_url, :string
  end
end
