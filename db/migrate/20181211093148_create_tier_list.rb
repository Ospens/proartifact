# frozen_string_literal: true

class CreateTierList < ActiveRecord::Migration[5.2]
  def change
    create_table :tier_lists do |t|
      t.string :name
      t.string :eng_name
      t.string :slug
      t.text :description
    end
  end
end
