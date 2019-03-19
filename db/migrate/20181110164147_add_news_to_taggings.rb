# frozen_string_literal: true

class AddNewsToTaggings < ActiveRecord::Migration[5.2]
  def change
    add_reference :taggings, :news, index: true
  end
end
