# frozen_string_literal: true

class CreateTierListCards < ActiveRecord::Migration[5.2]
  def change
    create_table :tier_list_cards do |t|
      t.references :card, foreign_key: true, index: true
      t.references :tier_list_group, foreign_key: true, index: true
      t.integer :order, index: true
    end
  end
end
