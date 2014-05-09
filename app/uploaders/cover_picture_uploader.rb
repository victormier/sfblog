# encoding: utf-8

class CoverPictureUploader < ImageUploader
  version :huge do
    process :set_width => 1300
  end

  version :mini, :from_version => :huge do
    process :set_width => 120
  end
end