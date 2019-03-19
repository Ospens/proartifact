# frozen_string_literal: true

class AddShortdescriptionToArticle < ActiveRecord::Migration[5.2]
  def change
    add_column :articles, :short_description, :text
  end
end
