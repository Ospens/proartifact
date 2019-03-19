# frozen_string_literal: true

class AddLoreToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :lore_text, :text
    add_column :cards, :ability_type, :integer
  end
end
