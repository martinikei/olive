# db/migrate/[timestamp]_create_profiles.rb

class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.text :bio
      t.text :interests
      t.integer :denomination
      t.text :attended_church
      t.text :gender
      t.text :location
      t.date :dob
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
