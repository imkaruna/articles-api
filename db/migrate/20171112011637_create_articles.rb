class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :description
      t.string :tags
      t.datetime :created_at
      t.datetime :updated_at
      t.integer :author_id

      t.timestamps
    end
  end
end
