class CreatePostPictures < ActiveRecord::Migration
  def change
    create_table :post_pictures do |t|
      t.string :picture
      t.integer :post_id
      t.integer :sort_order
      t.boolean :featured, default: false

      t.timestamps
    end
  end
end
