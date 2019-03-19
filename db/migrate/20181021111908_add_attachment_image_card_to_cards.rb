# frozen_string_literal: true

class AddAttachmentImageCardToCards < ActiveRecord::Migration[5.2]
  def self.up
    change_table :cards do |t|
      t.attachment :image_card
    end
  end

  def self.down
    remove_attachment :cards, :image_card
  end
end
