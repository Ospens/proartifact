# frozen_string_literal: true

class AddAuthorToArticles < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :author, :string, index: true
    add_column :articles, :author_link, :string, index: true
    add_column :articles, :is_published, :boolean, default: true, index: true
    add_column :articles, :article_source, :string, index: true
    add_column :articles, :article_source_link, :string, index: true
  end
end
