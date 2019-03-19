# frozen_string_literal: true

class CreateArticleRatings < ActiveRecord::Migration[5.2]
  def change
    create_table :article_ratings do |t|
      t.references :user, foreign_key: true, index: true
      t.references :article, foreign_key: true, index: true
      t.integer :rating, index: true
    end
  end
end
