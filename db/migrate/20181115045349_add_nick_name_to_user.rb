# frozen_string_literal: true

class AddNickNameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string, index: true
  end
end
