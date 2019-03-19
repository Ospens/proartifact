# frozen_string_literal: true

class AddPublishedToDecks < ActiveRecord::Migration[5.2]
  def change
    add_column :decks, :is_published, :boolean, index: true, default: false
  end
end
