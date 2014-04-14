class Post < ActiveRecord::Base
  include SlugBuilder
  attr_accessible :title, :content, :published, :date

  build_slug column_name: :title

  validates_presence_of :title
end