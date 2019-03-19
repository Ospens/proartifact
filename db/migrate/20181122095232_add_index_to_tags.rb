# frozen_string_literal: true

class AddIndexToTags < ActiveRecord::Migration[5.2]
  def change
    add_index :tags, :name
    add_index :news, :is_published
    add_index :articles, :is_published
    add_index :articles, :slug
    add_index :articles, :title
  end
end
