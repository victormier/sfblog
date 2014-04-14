module SlugBuilder
  extend ActiveSupport::Concern

  included do
    before_create :set_slug
    class_attribute :slug_options
    self.slug_options = {}
  end

  module ClassMethods
    def build_slug(options = {})
      self.slug_options = options
    end
  end

  def to_param
    self.slug
  end

  def set_slug
    column = slug_options[:column_name]
    raise self.class.name unless column

    value = self.send(column)
    slug = value.parameterize

    count = self.class.where(column => value).count
    slug = "#{slug}-#{count}" if count > 0

    self.slug = slug if self.slug.blank?
  end
end