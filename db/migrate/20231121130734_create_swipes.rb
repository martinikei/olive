# db/migrate/[timestamp]_create_swipes.rb

class CreateSwipes < ActiveRecord::Migration[7.0]
  def change
    create_table :swipes do |t|
      t.integer :swiper_id
      t.integer :swipee_id
      t.boolean :liked
      t.timestamps
    end
  end
end
