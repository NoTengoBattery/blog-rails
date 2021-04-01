class FixTitleUniquenessForArticle < ActiveRecord::Migration[6.1]
  def change
    remove_index :articles, :title
    add_index :articles, [:title, :user_id], unique: true
  end
end
