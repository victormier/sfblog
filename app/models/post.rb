class Post < ActiveRecord::Base
  include SlugBuilder
  attr_accessible :title, :content, :cover_text, :published, :date, :secondary, :cover_picture

  has_many :post_pictures, dependent: :destroy

  mount_uploader :cover_picture, CoverPictureUploader

  build_slug column_name: :title

  validates_presence_of :title

  scope :published, where(published: true)
  scope :newest_first, order(arel_table[:date].desc)
  scope :before_now, where(arel_table[:date].lt(DateTime.now))
  scope :primary, where(secondary: false)
  scope :secondary, where(secondary: true)
end