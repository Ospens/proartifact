# frozen_string_literal: true

class AddShorDescriptionToDeck < ActiveRecord::Migration[5.2]
  def change
    add_column :decks, :short_description, :text
  end
end
