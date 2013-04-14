class AddLinkToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :link, :string
  end
end
