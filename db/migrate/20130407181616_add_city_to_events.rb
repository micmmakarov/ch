class AddCityToEvents < ActiveRecord::Migration
  def change
    add_column :events, :city, :string
    add_column :events, :address, :string
  end
end
