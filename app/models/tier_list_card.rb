# frozen_string_literal: true

class TierListCard < ApplicationRecord
  belongs_to :tier_list_group
  belongs_to :card

  validates :card_id, uniqueness: true
end
