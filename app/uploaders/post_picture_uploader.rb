# encoding: utf-8

class PostPictureUploader < ImageUploader
  version :eight_cols do
    process :set_width => 610
  end

  version :three_cols, :from_version => :eight_cols do
    process :set_width => 210
  end

  version :mini, :from_version => :three_cols do
    process :set_width => 80
  end
end