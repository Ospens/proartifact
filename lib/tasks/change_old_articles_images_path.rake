# frozen_string_literal: true

namespace :paperclip do
  desc 'Recreate attachments and save them to new destination'
  task move_attachments_articles: :environment do
    Article.find_each do |article|
      unless article.title_image.blank?
        filename = Rails.root
                        .join('public', 'system', 'articles', 'title_images',
                              '000', '000', article.id.to_s.rjust(3, '0'),
                              'original', article.title_image.original_filename)
        if File.exist? filename
          puts "Re-saving image attachment #{article.id} - #{filename}"
          image = File.new filename
          article.title_image = image
          article.save
          # if there are multiple styles, you want to recreate them :
          article.title_image.reprocess!
          image.close
        end
      end
    end
  end
end
