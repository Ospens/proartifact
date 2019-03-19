# frozen_string_literal: true

class CreateGalleries < ActiveRecord::Migration[5.2]
  def change
    create_table :galleries do |t|
      t.string :title
      t.text :description_img
      t.datetime :publish_date

      t.timestamps
    end
  end
end
