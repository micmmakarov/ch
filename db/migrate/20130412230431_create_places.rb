class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :city
      t.string :state
      t.string :country
      t.integer :postal_code
      t.string :display_name
      t.integer :population

      t.timestamps
    end
  end
end
