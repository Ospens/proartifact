# frozen_string_literal: true

class CreateTaggings < ActiveRecord::Migration[5.2]
  def change
    create_table :taggings do |t|
      t.belongs_to :article, foreign_key: true, index: true
      t.belongs_to :tag, foreign_key: true, index: true

      t.timestamps
    end
  end
end
