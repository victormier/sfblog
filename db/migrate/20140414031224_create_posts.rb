class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :cover_text
      t.text :content
      t.boolean :published, default: false
      t.datetime :date
      t.datetime :end_date
      t.string :slug
      t.timestamps
    end
  end
end
