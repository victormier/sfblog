class Post < ActiveRecord::Base
  include SlugBuilder
  attr_accessible :title, :content, :cover_text, :published, :date

  has_many :post_pictures, dependent: :destroy

  build_slug column_name: :title

  validates_presence_of :title

  scope :published, where(published: true)
  scope :newest_first, order(arel_table[:date].desc)
  scope :before_now, where(arel_table[:date].lt(DateTime.now))
end