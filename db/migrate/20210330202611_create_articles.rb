class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.string :image_caption, null: false

      t.timestamps null: false

      t.foreign_key :users
    end

    add_index :articles, :user_id, unique: false
  end
end
