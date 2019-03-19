# frozen_string_literal: true

class CreateDecks < ActiveRecord::Migration[5.2]
  def change
    create_table :decks do |t|
      t.string :name
      t.string :eng_name
      t.text :description
      t.references :user, foreign_key: true, index: true
      t.datetime :published_at
      t.boolean :green_color, default: false, index: true
      t.boolean :red_color, default: false, index: true
      t.boolean :black_color, default: false, index: true
      t.boolean :blue_color, default: false, index: true
      t.integer :cards_count, index: true
      t.string :slug

      t.timestamps
    end
  end
end
