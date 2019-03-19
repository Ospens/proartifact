# frozen_string_literal: true

class AddSpellDescribeToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :ability_name, :string
    add_column :cards, :ability_description, :text
  end
end
