class DeleteUnusedDeviseUniqueIndex < ActiveRecord::Migration[6.1]
  def change
    # The issue here is that I forgot to remove this index when disabling this Devise module.
    remove_index :users, :reset_password_token
    remove_column :users, :reset_password_token
  end
end
