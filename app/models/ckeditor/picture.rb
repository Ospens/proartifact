# frozen_string_literal: true

module Ckeditor
  class Picture < Ckeditor::Asset
    has_attached_file :data,
                      url: '/pictures/:id/:style_:basename.:extension',
                      path: ':rails_root/public/pictures/:id/:style_:basename.:extension',
                      styles: { content: '900>', thumb: '118x100#' },
                      use_timestamp: false

    validates_attachment_presence :data
    validates_attachment_size :data, less_than: 2.megabytes
    validates_attachment_content_type :data, content_type: /\Aimage/

    def url_content
      url(:content)
    end
  end
end
