class AddIndexToArticleTitle < ActiveRecord::Migration[6.1]
  def change
      add_index :articles, :title
  end
end
