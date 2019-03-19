# frozen_string_literal: true

class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title, index: true
      t.string :eng_title, index: true
      t.text :short_description
      t.text :news_text
      t.datetime :publish_date, index: true
      t.string :slug, index: true

      t.timestamps
    end
  end
end
