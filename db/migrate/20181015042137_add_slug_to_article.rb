# frozen_string_literal: true

class AddSlugToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :slug, :string
    add_column :articles, :eng_title, :string
  end
end
