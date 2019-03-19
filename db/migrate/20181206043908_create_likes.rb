# frozen_string_literal: true

class CreateLikes < ActiveRecord::Migration[5.2]
  def change
    create_table :likes do |t|
      t.references :user, foreign_key: true, index: true
      t.references :likeable, polymorphic: true, index: true
      t.integer :vote, index: true, default: 0
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
