# frozen_string_literal: true

module GalleriesHelper
  def img_demensions(img_path)
    file = "public#{img_path}"
    Paperclip::Geometry.from_file(file)
  end

  def img_orientation(dem)
    a = dem.to_s.split('x').map(&:to_i)
    if  a[0] == a[1]
      'squad'
    elsif a[0] > a[1]
      'landscape'
    else
      'album'
    end
  end
end
