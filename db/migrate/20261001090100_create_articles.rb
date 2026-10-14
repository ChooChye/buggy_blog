class CreateArticles < ActiveRecord::Migration[8.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :slug
      t.string :status, null: false, default: "draft"
      t.datetime :published_at
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
