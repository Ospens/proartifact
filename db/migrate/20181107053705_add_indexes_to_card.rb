# frozen_string_literal: true

class AddIndexesToCard < ActiveRecord::Migration[5.2]
  def change
    add_index :cards, :attack
    add_index :cards, :armor
    add_index :cards, :health
    add_index :cards, :item_gold
    add_index :cards, :title
    add_index :cards, :card_class
    add_index :cards, :item_type
    add_index :cards, :color
    add_index :cards, :rarity
    add_index :cards, :manacost
  end
end
