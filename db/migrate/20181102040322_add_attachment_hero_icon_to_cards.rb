# frozen_string_literal: true

class AddAttachmentHeroIconToCards < ActiveRecord::Migration[5.2]
  def self.up
    change_table :cards do |t|
      t.attachment :hero_icon
    end
  end

  def self.down
    remove_attachment :cards, :hero_icon
  end
end
