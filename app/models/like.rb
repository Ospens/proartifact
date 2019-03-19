# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :likeable, polymorphic: true, touch: true

  scope :dislikes, -> { where(vote: -1) }
  scope :likes, -> { where(vote: 1) }
end
