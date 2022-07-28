class CreateArticleCategories < ActiveRecord::Migration[6.0]
  def up
    create_table :article_categories do |t|
      t.integer :article_id
      t.integer :category_id
      t.integer :number
    end
  end

  def down
    drop_table :article_categories
  end
end
