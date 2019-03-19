# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :taggings
  has_many :articles, through: :taggings
  has_many :news, through: :taggings

  def self.counts
    limit(5).select('name, count(taggings.tag_id) as count').joins(:taggings)
            .group('taggings.tag_id, tags.id, tags.name')
  end

  def hash_name
    "##{name || ''}"
  end
end
