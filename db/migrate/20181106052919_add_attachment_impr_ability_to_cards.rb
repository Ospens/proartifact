# frozen_string_literal: true

class AddAttachmentImprAbilityToCards < ActiveRecord::Migration[5.2]
  def self.up
    change_table :cards do |t|
      t.attachment :impr_ability
    end
  end

  def self.down
    remove_attachment :cards, :impr_ability
  end
end
