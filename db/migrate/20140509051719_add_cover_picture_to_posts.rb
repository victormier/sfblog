class AddCoverPictureToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :cover_picture, :string
  end
end
