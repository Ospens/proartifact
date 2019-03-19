# frozen_string_literal: true

class AddEngTitleToCard < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :eng_title, :string
  end
end
