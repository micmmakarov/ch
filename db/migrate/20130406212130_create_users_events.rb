class CreateUsersEvents < ActiveRecord::Migration
  def change
    create_table :users_events, :id => false do |t|
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
    add_index :users_events, [:user_id, :event_id], :unique => true
  end
end
