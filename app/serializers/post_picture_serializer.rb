class PostPictureSerializer < ActiveModel::Serializer
  attributes :image, :thumb

  def image
    object.picture.three_cols.url
  end

  def thumb
    object.picture.mini.url
  end
end