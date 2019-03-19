# frozen_string_literal: true

class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :article_text
      t.datetime :publish_date

      t.timestamps
    end
  end
end
