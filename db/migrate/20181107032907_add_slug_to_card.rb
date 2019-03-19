# frozen_string_literal: true

class AddSlugToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :slug, :string, index: true
  end
end
