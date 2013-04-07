class AddFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :website, :string
    add_column :users, :facebook, :string
    add_column :users, :twitter, :string
    add_column :users, :contact, :string
    add_column :users, :location, :string
  end
end
