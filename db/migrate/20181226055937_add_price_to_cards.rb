# frozen_string_literal: true

class AddPriceToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :steam_market_id, :integer, index: true
    add_column :cards, :steam_item_nameid, :integer, index: true
    add_column :cards, :market_price, :float, default: 0, index: true
  end
end
