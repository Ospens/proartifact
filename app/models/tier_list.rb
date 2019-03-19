# frozen_string_literal: true

class TierList < ApplicationRecord
  include Impressionist::IsImpressionable
  is_impressionable
  extend FriendlyId
  friendly_id :eng_name, use: %i[slugged history finders]

  has_many :tier_list_groups
end
