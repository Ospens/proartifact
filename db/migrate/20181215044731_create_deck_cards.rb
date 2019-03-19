# frozen_string_literal: true

class CreateDeckCards < ActiveRecord::Migration[5.2]
  def change
    create_table :deck_cards do |t|
      t.references :card, foreign_key: true, index: true
      t.references :deck, foreign_key: true, index: true
      t.integer :hero_order, index: true
      t.integer :card_count, index: true
    end
  end
end
