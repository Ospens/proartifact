# frozen_string_literal: true

class DeckCard < ApplicationRecord
  belongs_to :deck
  belongs_to :card
end
