class PostPicture < ActiveRecord::Base
  include RankedModel

  mount_uploader :picture, PostPictureUploader

  belongs_to :post, touch: true

  ranks :sort_order, :with_same => :post_id

  attr_accessible :picture

  before_validation :set_order, on: :create

  scope :ordered, rank(:sort_order)
  scope :featured, where(featured: true)

  private

  def set_order
    self.update_attribute :sort_order_position, :last
  end
end