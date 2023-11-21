class AddFieldsToProfile < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :name, :string
    add_column :profiles, :surname, :string
    add_column :profiles, :hobbies, :string
    add_column :profiles, :work, :string
  end
end
