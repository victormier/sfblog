class RecreatePostPictureVersions < ActiveRecord::Migration
  def up
    PostPicture.all.each do |post_picture|
      post_picture.picture.recreate_versions!
    end
  end

  def down
  end
end
