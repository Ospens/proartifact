# frozen_string_literal: true

class AddOmniauthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :password_generated, :boolean, default: false, index: true
  end
end
