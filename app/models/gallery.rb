# frozen_string_literal: true

class Gallery < ApplicationRecord
  include Impressionist::IsImpressionable
  is_impressionable
  has_attached_file :image,
                    styles: { medium: '150x150', thumb: '300x180#' },
                    default_url: '/images/:style/missing.png',
                    path: ':rails_root/public/images/gallery/:id/:attachment/:style/:filename',
                    url: '/images/gallery/:id/:attachment/:style/:filename',
                    use_timestamp: false
  validates :image, :title, :description_img, :publish_date, presence: true
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}

  before_save :extract_dimensions
  serialize :dimensions

  def image?
    image_content_type =~ %r{^(image|(x-)?application)/(bmp|gif|jpeg|jpg|pjpeg|png|x-png)$}
  end

  private

  def extract_dimensions
    return unless image?

    tempfile = image.queued_for_write[:original]
    return if tempfile.nil?

    geometry = Paperclip::Geometry.from_file(tempfile)
    geometry.auto_orient
    self.image_width = geometry.width.to_i
    self.image_height = geometry.height.to_i
  end
end
