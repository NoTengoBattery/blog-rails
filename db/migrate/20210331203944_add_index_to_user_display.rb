class AddIndexToUserDisplay < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :display, unique: true
  end
end
