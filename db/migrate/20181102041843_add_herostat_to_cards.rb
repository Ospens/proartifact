# frozen_string_literal: true

class AddHerostatToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :attack, :integer
    add_column :cards, :armor, :integer
    add_column :cards, :health, :integer
    add_column :cards, :item_gold, :integer
  end
end
