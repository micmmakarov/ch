class AddImagesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :cover_image_url, :string
  end
end
