# frozen_string_literal: true

class CreateTierListGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :tier_list_groups do |t|
      t.string :name
      t.integer :order
      t.references :tier_list, foreign_key: true, index: true
    end
  end
end
