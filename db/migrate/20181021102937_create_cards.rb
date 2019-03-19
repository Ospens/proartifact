# frozen_string_literal: true

class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.text :description
      t.integer :card_class
      t.integer :item_type
      t.integer :color
      t.integer :rarity
      t.integer :manacost

      t.timestamps
    end
  end
end
