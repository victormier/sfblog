# encoding: utf-8

class PostPictureUploader < ImageUploader
  version :six_cols do
    process :set_width => 1100
  end

  version :four_cols, from_version: :six_cols do
    process :set_width => 720
  end

  version :two_cols, from_version: :four_cols do
    process :set_width => 340
  end

  version :mini, :from_version => :two_cols do
    process :set_width => 80
  end
end