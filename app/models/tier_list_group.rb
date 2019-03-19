# frozen_string_literal: true

class TierListGroup < ApplicationRecord
  belongs_to :tier_list
  has_many :tier_list_cards
end
