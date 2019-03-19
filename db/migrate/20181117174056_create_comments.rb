# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true, index: true
      t.references :commentable, polymorphic: true, index: true
      t.integer :parent_id, index: true
      t.text :body
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
