class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start
      t.integer :user_id

      t.timestamps
    end
  end
end
