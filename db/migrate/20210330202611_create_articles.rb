class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.string :image_caption

      t.timestamps
    end
  end
end
