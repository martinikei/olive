class ChangeProfile < ActiveRecord::Migration[7.0]
  def up
    change_column :profiles, :denomination, :text
  end

  def down
    # If you need to revert the change, you can define the down method
    # However, changing from text to integer might result in data loss,
    # so use with caution and only if necessary.
    change_column :profiles, :denomination, :integer
  end
end
