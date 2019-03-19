# frozen_string_literal: true

class AddParentToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :hero_parent_id, :integer, default: nil
  end
end
