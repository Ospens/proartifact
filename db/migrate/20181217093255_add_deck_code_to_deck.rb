# frozen_string_literal: true

class AddDeckCodeToDeck < ActiveRecord::Migration[5.2]
  def change
    add_column :decks, :deck_code, :string, index: true
  end
end
