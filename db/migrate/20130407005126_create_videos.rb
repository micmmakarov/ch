class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :url
      t.string :title
      t.text :description
      t.integer :user_id
      t.integer :event_id

      t.timestamps
    end
  end
end
