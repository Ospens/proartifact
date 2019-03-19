# frozen_string_literal: true

class CreateAuthorizations < ActiveRecord::Migration[5.2]
  def change
    create_table :authorizations do |t|
      t.string :provider, index: true
      t.string :uid, index: true
      t.references :user, foreign_key: true, index: true
      t.string :token
      t.string :secret
      t.string :first_name
      t.string :last_name
      t.string :name
      t.string :link

      t.timestamps
    end
  end
end
