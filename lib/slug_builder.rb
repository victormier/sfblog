module SlugBuilder
  extend ActiveSupport::Concern

  included do
    before_create :set_slug
    class_attribute :slug_options
    self.slug_options = {}
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

  # Class methods
  module ClassMethods
    def build_slug(options = {})
      self.slug_options = options
    end

    def find_for_show(value)
      self.find_by_slug(value)
    end
  end

  # Instance methods
  def to_param
    self.slug
  end
end