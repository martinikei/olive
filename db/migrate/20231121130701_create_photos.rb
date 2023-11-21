# db/migrate/[timestamp]_create_photos.rb

class CreatePhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :photos do |t|
      t.references :profile, foreign_key: true
      t.text :name 
      t.boolean :is_main
      t.timestamps
    end
  end
end
