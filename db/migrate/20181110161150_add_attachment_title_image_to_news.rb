# frozen_string_literal: true

class AddAttachmentTitleImageToNews < ActiveRecord::Migration[5.2]
  def self.up
    change_table :news do |t|
      t.attachment :title_image
    end
  end

  def self.down
    remove_attachment :news, :title_image
  end
end
