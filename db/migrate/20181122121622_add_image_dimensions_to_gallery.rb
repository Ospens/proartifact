# frozen_string_literal: true

class AddImageDimensionsToGallery < ActiveRecord::Migration[5.2]
  def change
    add_column :galleries, :image_width, :integer
    add_column :galleries, :image_height, :integer
  end
end
