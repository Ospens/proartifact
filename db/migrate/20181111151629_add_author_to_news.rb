# frozen_string_literal: true

class AddAuthorToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :author, :string, index: true
    add_column :news, :author_link, :string, index: true
    add_column :news, :news_source, :string, index: true
    add_column :news, :news_source_link, :string, index: true
    add_column :news, :is_published, :boolean, default: true, index: true
  end
end
