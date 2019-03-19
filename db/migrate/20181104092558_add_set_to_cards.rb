# frozen_string_literal: true

class AddSetToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :card_set, :integer
  end
end
