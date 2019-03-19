# frozen_string_literal: true

class AddAttachmentSecondHeroSpellsToCards < ActiveRecord::Migration[5.2]
  def self.up
    change_table :cards do |t|
      t.attachment :second_hero_spells
    end
  end

  def self.down
    remove_attachment :cards, :second_hero_spells
  end
end
