class AddTestimony < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :testimony, :string
  end
end
