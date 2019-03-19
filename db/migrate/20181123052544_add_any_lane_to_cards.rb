# frozen_string_literal: true

class AddAnyLaneToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :any_lane, :boolean
    add_index :cards, :any_lane
    add_column :cards, :second_hero_ability_title, :string
    add_column :cards, :second_hero_ability_description, :text
    add_column :cards, :second_hero_ability_type, :integer
  end
end
