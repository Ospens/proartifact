# frozen_string_literal: true

namespace :paperclip do
  desc 'Recreate attachments and save them to new destination'
  task move_attachments_galleries: :environment do
    Gallery.find_each do |gallery|
      unless gallery.image.blank?
        filename = Rails.root
                        .join('public', 'system', 'galleries', 'images',
                              '000', '000', gallery.id.to_s.rjust(3, '0'),
                              'original', gallery.image.original_filename)
        if File.exist? filename
          puts "Re-saving image attachment #{gallery.id} - #{filename}"
          image = File.new filename
          gallery.image = image
          gallery.save
          # if there are multiple styles, you want to recreate them :
          gallery.image.reprocess!
          image.close
        end
      end
    end
  end
end
