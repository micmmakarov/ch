class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :state
      t.string :yelp

      t.timestamps
    end
  end
end
