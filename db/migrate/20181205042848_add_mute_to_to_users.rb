# frozen_string_literal: true

class AddMuteToToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :mute_to, :datetime, index: true, default: nil
  end
end
