# frozen_string_literal: true

class AddAttachmentTitleImageToArticles < ActiveRecord::Migration[5.2]
  def self.up
    change_table :articles do |t|
      t.attachment :title_image
    end
  end

  def self.down
    remove_attachment :articles, :title_image
  end
end
